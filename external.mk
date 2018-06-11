include $(sort $(wildcard $(BR2_EXTERNAL_GPORTAY_PATH)/package/*/*.mk))

update-wpa-supplicant:
	if [ -d /etc/wpa_supplicant/ ]; then \
		$(call MESSAGE,"Update WPA Supplicant configuration hook"); \
		rsync -av /etc/wpa_supplicant/*.conf \
		          $(BR2_EXTERNAL_GPORTAY_PATH)/board/gportay/overlay/etc/wpa_supplicant/; \
	fi

target-finalize: update-wpa-supplicant

.PHONY: rmbuild
rmbuild:
	rm -rf $(BUILD_DIR)/*/*
