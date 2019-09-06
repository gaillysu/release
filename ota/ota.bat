pscli -usb 0  merge oem_key.psr
UpgradeFileGen qcc3003.upg qcc3003_upg.xuv
dfusign -v -f -u -h qcc3003_upg.xuv -o qcc3003_upg_signed.xuv -ka oem.private.key
xuv2bin -d qcc3003_upg_signed.xuv qcc3003_upg_signed.bin

