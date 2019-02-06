#!/bin/bash

sudo mv /usr/share/dbus-1/services/org.gtk.vfs.GPhoto2VolumeMonitor.service /usr/share/dbus-1/services/org.gtk.vfs.GPhoto2VolumeMonitor.service.bak
sudo mv /usr/share/gvfs/mounts/gphoto2.mount /usr/share/gvfs/mounts/gphoto2.mount.bak
sudo mv /usr/share/gvfs/remote-volume-monitors/gphoto2.mount /usr/share/gvfs/remote-volume-monitors/gphoto2.mount.bak
sudo mv /usr/lib/gvfs/gvfs-gphoto2-volume-monitor /usr/lib/gvfs/gvfs-gphoto2-volume-monitor.bak
sudo mv /usr/lib/gvfs/gvfsd-gphoto2 /usr/lib/gvfs/gvfsd-gphoto2.bak
