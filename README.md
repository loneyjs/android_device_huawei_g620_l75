## Device tree for Huawei G620-L75

Based on https://github.com/cyanogenmod/android_device_huawei_g620_a2 created by @Lloir & @thoemy
Copyright 2016, The CyanogenMod Project

Device tree originally created by Crixec.

### Extracting proprietary files

The proprietary files should be extracted from device running CyanogenMod. If
you want to use the official Huawei Android 4.4.4 ROM you need to make the
following changes for a successful extraction.

Copy the following files from the boot.img ramdisk to `system/bin`:

  *  `sbin/libqmi_oem_main` -> `system/bin/libqmi_oem_main`
  *  `sbin/rmt_oeminfo` -> `system/bin/rmt_oeminfo`
  *  `sbin/rmt_storage` -> `system/bin/rmt_storage`

Deodex the following odex files and put the classes.dex in the related apk or
jar file:

  * `app/com.qualcomm.location.odex`
  * `system/app/qcrilmsgtunnel.odex`
  * `system/app/TimeService.odex`
  * `framework/qcnvitems.odex`
  * `framework/qcrilhook.odex`

The basic DEODEX procedure is as follows:

```bash
baksmali -x "$ODEX_FILE" -d system/framwork -o "$OUT_DIR"
smali "$OUT_DIR" -o "$OUT_DIR/classes.dex"
zip -j -u "$APK_FILE" "$OUT_DIR/classes.dex"
```

Hexedit `vendor/lib/libqc-opt.so` to use ICU53 symbols.

```bash
sed -i -e 's/utext_openUChars_51/utext_openUChars_53/g'\
    -e 's/utext_close_51/utext_close_53/g' \
    -e 's/u_errorName_51/u_errorName_53/g' \
    -e 's/u_digit_51/u_digit_53/g' \
    vendor/lib/libqc-opt.so
```
