# เปลี่ยนชื่อ username บน Linux

## ส่ิงที่ต้องทำ
1. login ด้วยสิทธิ์ root หรือ สร้าง user ใหม่ และให้สิทธิ์เป็น root แล้ว login ด้วย user นั้น
1. เปลี่ยนชื่อใหม่ `sudo usermod -l newUsername oldUsername`
1. ย้าย home directory `sudo usermod -d /home/newHomeDir -m newUsername`
1. เปลี่ยนชื่อ group `sudo groupmod -n newUsername oldUsername`

## รายละเอียดของแต่ละขั้นตอน
### สร้าง user ชั่วคราว ใหม่
Linux ไม่อนุญาติให้เปลี่ยนชื่อ username ของ user ที่ login อยู่ ดังนั้นเราจะต้องสร้าง user ใหม่ แล้วให้สิทธิ์เป็น root แล้ว login ด้วย user นั้น

```bash
sudo useradd -m -s /bin/bash tempUsername
sudo passwd tempUsername
sudo usermod -aG sudo tempUsername
su - tempUsername
```
คำอธิบาย
- `useradd` สร้าง user ใหม่
- `-m` สร้าง home directory ใหม่
- `-s  /bin/bash` กำหนด shell ใหม่  // ไม่จำเป็นต้องใส่ก็ได้
- `passwd` กำหนดรหัสผ่านใหม่
- `usermod` กำหนดสิทธิ์ให้เป็น root `-aG` เพิ่ม user ลงใน group sudo
- `su` login ด้วย user ใหม่

หรือ `sudo useradd tempUsername` แล้วจะถามรหัสผ่านใหม่ แล้วก็ `sudo usermod -aG sudo tempUsername` ได้เลย

ตรวจสอยว่า ว่ามี user ใหม่เพิ่มเข้ามาหรือไม่
```bash
cat /etc/passwd

# ผลลัพธ์
#...
tempUsername:x:1001:1001::/home/tempUsername:/bin/bash
```

### ทำการ logout แล้ว login ด้วย user ใหม่

หากไม่ logout แล้ว login ด้วย user ใหม่ จะเกิดปัญหาเมื่อต้องการเปลี่ยนชื่อ username ที่ login อยู่
เพราะ session ของ user ที่ login อยู่เดิมยังคงใช้งานอยู่จะไม่สามารถเปลี่ยนชื่อ username ได้
```bash
ssh tempUsername@ip-address
```

### เปลี่ยนชื่อ username ที่อยากเปลี่ยน
```bash
sudo usermod -l newUsername oldUsername
```

### ย้าย home directory
```bash
sudo usermod -d /home/newHomeDir -m newUsername
```

### เปลี่ยนชื่อ group
```bash
sudo groupmod -n newUsername oldUsername
```

## ตรวจสอบ
```bash
cat /etc/passwd

# ผลลัพธ์
#...
newUsername:x:1001:1001::/home/newHomeDir:/bin/bash

cat /etc/group

# ผลลัพธ์
#...
newUsername:x:1001:
```

## รีสตาร์ทเครื่อง
```bash
sudo reboot
```
แล้ว login ด้วย user ใหม่

## หากต้องการให้ user ใหม่เป็น root
```bash
sudo usermod -aG sudo newUsername
```

## หากต้องการ sudo su โดยไม่ต้องใส่รหัสผ่าน
```bash
sudo vim /etc/sudoers.d/010_oldUsername-nopasswd

# แก้ไขเป็น
newUsername ALL=(ALL) NOPASSWD: ALL
```
พร้อมทั้งเปลี่ยนชื่อไฟล์เป็น `010_newUsername-nopasswd`

## ลบ user ชั่วคราว
```bash
sudo userdel -r tempUsername
```


