generate:
	mise x -- tuist install
	mise x -- tuist generate --no-open
	xed .

clean:
	rm -f .package.resolved
	rm -f Podfile.lock
	rm -rf ./Pods
	rm -rf ./*.xcodeproj
	rm -rf ./*.xcworkspace
	mise x -- tuist clean

clean_all:
	$(MAKE) clean
	rm -rf ./FlutterModule
	@echo "🧹 Complete cleanup including Flutter modules"

edit:
	mise x -- tuist edit

flutter_module:
	sh scripts/install_flutter_module.sh $(version)

sign_flutter_frameworks:
	@echo "🔐 Signing Flutter XCFrameworks..."
	@if [ -d "FlutterModule/Release" ]; then \
		frameworks=("device_info_plus.xcframework" "fluttertoast.xcframework"); \
		for framework in $${frameworks[@]}; do \
			framework_path="FlutterModule/Release/$$framework"; \
			if [ -d "$$framework_path" ]; then \
				echo "Signing $$framework with Apple Distribution certificate..."; \
				codesign --force --sign "Apple Distribution: Specup Ad Co.,Ltd. (TG22ZHQ59G)" --preserve-metadata=identifier,entitlements "$$framework_path"; \
				echo "✅ Distribution signed: $$framework"; \
			fi; \
		done; \
		echo "✅ All Flutter frameworks signed for distribution!"; \
	else \
		echo "❌ FlutterModule/Release directory not found"; \
	fi
	
# ARM64 서명 확인 (개선된 버전)
check_arm64:
	@echo "🔍 Checking ARM64 signatures for Flutter frameworks..."
	@echo "=================================================="
	@for framework in FlutterModule/Release/*.xcframework; do \
		if [ -d "$$framework" ]; then \
			fname=$$(basename "$$framework"); \
			arm64_path="$$framework/ios-arm64/$${fname%.xcframework}.framework"; \
			if [ -d "$$arm64_path" ]; then \
				echo "📦 $$fname:"; \
				if codesign -dv "$$arm64_path" 2>&1 | grep -q "Identifier="; then \
					if codesign -dvvv "$$arm64_path" 2>&1 | grep -q "Authority=Apple Distribution"; then \
						echo "  ✅ Distribution Signed (App Store Ready)"; \
					elif codesign -dvvv "$$arm64_path" 2>&1 | grep -q "Authority=Apple Development"; then \
						echo "  ⚠️  Development Signed"; \
					elif codesign -dvvv "$$arm64_path" 2>&1 | grep -q "Authority=Developer ID Application"; then \
						echo "  📝 Developer ID Signed"; \
					else \
						echo "  🔍 Signed (Unknown Type)"; \
					fi; \
					teamid=$$(codesign -dvvv "$$arm64_path" 2>&1 | grep "TeamIdentifier=" | cut -d'=' -f2 | head -1); \
					if [ -n "$$teamid" ]; then \
						echo "  👥 Team: $$teamid"; \
					fi; \
					if codesign -v "$$arm64_path" 2>/dev/null; then \
						echo "  ✅ Verification: PASSED"; \
					else \
						echo "  ❌ Verification: FAILED"; \
					fi; \
				else \
					echo "  ❌ Not signed"; \
				fi; \
				echo ""; \
			else \
				echo "📦 $$fname: ❌ No ARM64 architecture"; \
			fi; \
		fi; \
	done
