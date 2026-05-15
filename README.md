🛠 Tizim Tadqiqot va Tahlil Skripti (Bash Project)
Ushbu loyiha Linux tizimini avtomatlashtirilgan tarzda tahlil qilish, tizim resurslarini boshqarish va ma'lumotlarni samarali qayta ishlash ko'nikmalarini rivojlantirish maqsadida yaratilgan. Loyiha "noldan boshlash" tamoyili asosida, bosqichma-bosqich murakkablashib borgan amaliy topshiriqlar natijasidir.

📋 Loyiha Bosqichlari va Amalga Oshirilgan Ishlar
1. Tizim Ma'lumotlarini Diagnostika Qilish
Loyihaning birinchi qismida tizimning real vaqtdagi holatini aniqlash funksiyalarini ishlab chiqdik. Skript quyidagi ma'lumotlarni yig'adi:

Hostname va operatsion tizim versiyasi.

Tarmoq ma'lumotlari (IP manzil, Gateway).

Resurslar holati (RAM va Disk xotirasi sig'imi hamda bo'sh joyi).

Tizimning ishlayotgan vaqti (Uptime).

2. Vizual Dizayn va ANSI Ranglar Tizimi
Ma'lumotlarni terminalda tushunarli va chiroyli jadval ko'rinishida chiqarish uchun ANSI Escape kodlaridan foydalanildi. Bu bosqichda terminal interfeysini ranglar (fon va matn ranglari) yordamida vizual jihatdan boyitishni o'rgandik.

3. Mantiqiy Tekshiruv va Xatoliklar Bilan Ishlash (Validation)
Skriptning barqarorligini ta'minlash uchun xavfsizlik qatlamlari qo'shildi:

Foydalanuvchi kiritgan parametrlar sonini tekshirish.

Rang kodlarining to'g'riligini (1-6 oralig'ida) nazorat qilish.

Fon va matn rangi bir xil bo'lib qolsa, ma'lumot o'qilmay qolishining oldini olish uchun "Ranglar to'qnashuvi" tekshiruvi joriy etildi.

4. Konfiguratsiya Fayli (Config Management)
Skriptni yanada professional qilish uchun sozlamalarni tashqi config.conf faylidan o'qish mexanizmi yaratildi. Bunda eng muhim o'rganilgan narsa — Default (Zaxira) qiymatlar mantiqi bo'ldi. Ya'ni, agar foydalanuvchi konfig faylda biror parametrni bo'sh qoldirsa, skript o'zi avtomatik ravishda standart ranglarni tanlab, ishda davom etadi.

5. Fayl Tizimini Chuqur Tahlil Qilish
Loyihaning eng murakkab analitik qismi bo'lib, quyidagi vazifalarni bajaradi:

Berilgan katalogdagi barcha ichki papkalarni rekursiv sanash.

Hajmi bo'yicha eng og'ir 5 ta papkani saralab chiqarish.

Fayllarni turlari bo'yicha tahlil qilish (Configuration, Text, Executable, Log, Archive, Symbolic links).

Eng yirik 10 ta faylni kengaytmalari bilan ko'rsatish.

Xavfsizlik: Eng katta bajariladigan (exe) fayllarning MD5 barmoq izini (hash) hisoblash.

Taymer: Skriptning umumiy ish vaqtini (nanosekundlargacha aniqlikda) o'lchash.

🎓 O'rganilgan Texnik Ko'nikmalar
Ushbu loyihani noldan yozish davomida quyidagi bilimlarni amalda qo'lladim:

Bash Dasturlash Asoslari: O'zgaruvchilar, funksiyalar, shartli operatorlar (if/else, case) va sikllar (while loop).

Linux CLI Professional Asboblari: find (fayl qidirish), du (hajm o'lchash), grep (saralash), awk va sed (matnni havoda tahrirlash) komandalarini quvurlar (|) orqali birlashtirish.

Data Parsing: Murakkab matnlarni qismlarga bo'lish, bo'sh joyli fayl nomlari bilan xatosiz ishlash va matn oqimini o'zgaruvchilarga o'zlashtirish.

Tizim Arxitekturasi: Linux fayl tizimi tuzilishi, ruxsatnomalar (Permissions) va xavfsizlik xeshlari (MD5 hash).

Avtomatlashtirish Madaniyati: Takrorlanuvchi ishlarni bitta skript yordamida soniyalar ichida bajarish va loyihani modullarga ajratish.
