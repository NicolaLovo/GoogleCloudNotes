# Managing disks

- `lsblk` -> list block devices
- `df -k` -> list file systems
- `gcloud compute instances attach-disk ${instanceName} --disk ${newDisk} -- zone ${zone}`
- `sudo file -s /dev/${blockDeviceName}` -> view disk status
  - es. `sudo file -s /dev/sdb`
  - if it outputs "data" it means that it is a raw data device -> need to format it:
    - `sudo mkfs.ext4 -F /dev/sdb`
  - now mount the disk: `sudo mount /dev/${blockDeviceName} ${targetFolderPath}`
    - es. `sudo mount /dev/sdb /newpd`

## Re-mount device on reboot

If I reboot the device, the block device does not get automatically mounted: need to change linux  configuration file `fstab`

- `sudo blkid /dev/${blockDeviceName}` -> obtain block device UUID
  - es. `sudo blkid /dev/sdb` -> `/dev/sdb: PTUUID="ace244f7-6ca0-4c56-a3c7-ed977b846bba" PTTYPE="gpt"`
- `sudo nano /etc/fstab` -> 
  - append at the end of file `UUID=${uuid} ${folder} ${format} defaults,nofail`
    - `UUID=ace244f7-6ca0-4c56-a3c7-ed977b846bba /newpd ext4 defaults,nofail` (without `"`)
- `sudo mount -a` or restart VM -> mount all partitions available in `fstab`

## Resize disk

`gcloud compute disks resize ${diskName} --size ${newSizeGB} --zone ${zone}` -> resize disk on Google Cloud. Can make it larger, but not smaller.

After resizing disk on Google Cloud need to resize also fileSystem:

- `sudo resize2fs /dev/sdb`

Detach disk: `gcloud compute instances detach-disk ${instanceName} --disk ${diskName} --zone ${zone}`

