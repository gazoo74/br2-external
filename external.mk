include $(sort $(wildcard $(BR2_EXTERNAL_GPORTAY_PATH)/package/*/*.mk))

.PHONY: update-wpa-supplicant
update-wpa-supplicant:
	if [ -d /etc/wpa_supplicant/ ]; then \
		$(call MESSAGE,"Update WPA Supplicant configuration hook"); \
		rsync -av --exclude .gitignore \
		          /etc/wpa_supplicant/. \
		          $(BR2_EXTERNAL_GPORTAY_PATH)/board/gportay/overlay/etc/wpa_supplicant/; \
	fi

target-finalize: update-wpa-supplicant

.PHONY: rm-build
rm-build:
	rm -rf $(BUILD_DIR)/*/*

.PHONY: rm-target
rm-target:
	rm -rf $(BASE_TARGET_DIR)
	rm -rf $(BUILD_DIR)/*/.stamp_target_installed
