

step 1:
nvscmd -usb 0 erase


step2:

clean project and build again, run it (burn four files into device)

step3:
3.1: merge file: sink_system_qcc300x.psr (must do firstly)
3.2: merge file: qcc3003.psr


step4: configure by pstool and ADK tool, disable the upgrade option "enable Application config reset",
    
       make sure the device bluetooth work well.




step5:  merge oem_key.psr by command "pscli -usb 0  merge oem_key.psr"   // if you want to use another key, pls firstly erase your device, the different key will get validation failed error code 0x0032


above steps should be done in factory
=========================================================================================================================




========================================================================================================================
below is done by user


step6: remove the old "gaiaControl" app, install the new "app.apk", copy the "qcc3003_upg_signed.bin" into your smartphone.

step7:open the app, connect device with BREDR mode, upgrade it.



command samples:


pscli -usb 0  merge oem_key.psr
UpgradeFileGen qcc3003.upg qcc3003_upg.xuv
dfusign -v -f -u -h qcc3003_upg.xuv -o qcc3003_upg_signed.xuv -ka oem.private.key
xuv2bin -d qcc3003_upg_signed.xuv qcc3003_upg_signed.bin


upgrade samples:

sample 1: qcc3003.upg include VM application and audio resource, upgrade file is qcc3003_upg_signed.bin
sample 2: only update audio resource, upgrade file is qcc3003_upg_signed_audio.bin


NOTICE: the key files should not been modified , otherwise it will let the upgrade fail (error code:0x003D)
        if you get this errorcode, pls open PStool and check dfu values by typing "dfu" ,and merge the oem_key.psr again.


