#imshare

Screen capture tool for Ubuntu. Supports screen selection and upload images to imgur.com.

Features
----
* Upload screen selection to imgur
* Upload image files, usage: ``$ imshare [FILE1] .. [FILE123]``
* Copy link to clipboard
* Desktop and sound notifications
* History and deletion links are stored in ~/.imshare.log

### Install

```bash
$ sudo apt-get install curl notify-osd xclip
$ sudo dpkg -i imshare_1.0-1_all.deb
```

### Add to Ubuntu Unity Launcher

1. Open Unity Dash
2. Search "imshare"
3. Drag the IMShare icon and drop into the launcher

![](http://i.imgur.com/H3ljYqF.png)

### Create Hotkey

1. Open System Settings, Keyboard, Shortcuts, Custom Shortcuts
2. Click "+" button, fill "imshare" in the "Name" and "Command", click apply  
3. Click "Disabled" and press "Ctrl+p" or another key combination

![](http://i.imgur.com/UtPDFmF.png)

## License

GPL
