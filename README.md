#imshare

Screen capture tool for Ubuntu. Supports screen selection and upload images to imgur.com.

Features:

* Screen selection capture
* Uploading to imgur.com
* Upload image files, usage: ``$ imshare [<filename> [...]]``
* Copy link to clipboard
* Desktop and sound notifications
* History and deletion links are stored in ``~/.imshare.log``

Install
----

Download [imshare_1.0-1_all.deb](https://github.com/x25/imshare/releases/download/v1.0/imshare_1.0-1_all.deb).

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
2. Click "+" button, fill in the "Name" and "Command" value "imshare", click apply  
3. Click "Disabled" and press "Ctrl+p" or another key combination

![](http://i.imgur.com/UtPDFmF.png)

## License

GPL
