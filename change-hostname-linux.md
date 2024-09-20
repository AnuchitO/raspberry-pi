# เปลี่ยนชื่อ Hostname ของเครื่อง Linux

## ส่ิงที่ต้องทำ
1. ตรวจสอบชื่อ Hostname ปัจจุบัน โดยใช้คำสั่ง `hostname` หรือ `cat /etc/hostname`
1. แก้ไขไฟล์ `/etc/hostname` และ `/etc/hosts` โดยใช้คำสั่ง `vim /etc/hostname` เปลี่ยนชื่อ Hostname ใหม่ เช่น `TiangNa`
1. แก้ไขไฟล์ `/etc/hosts` โดยใช้คำสั่ง `vim /etc/hosts` เปลี่ยนชื่อ Hostname ใหม่ที่จับคู่กับ loopback address `127.0.1.1 		TiangNa`
1. รีสตาร์ทเครื่องใหม่โดยใช้คำสั่ง `sudo reboot`