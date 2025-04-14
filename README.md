
# Laravel Docker Setup 🐳

## 🌐 Language | Language

- [🇮🇷 فارسی](#فارسی)
- [🇺🇸 English](#english)

---

## 🇺🇸 English

Quick setup for a Laravel project with Docker, including PHP, MySQL, Nginx, and phpMyAdmin.

---

## 📁 Project Structure


```
├── docker
│   └── nginx
│       └── default.conf
├── src
│   └── (Laravel Files)
├── Dockerfile
├── docker-compose.yml
└── README.md
```


---

## ⚙️ Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)
- [Composer](https://getcomposer.org/) (optional, if you want to install Laravel)

---

## 🚀 Setup Steps

### 1. Clone the project

```bash
git clone git@github.com:siamaknaghel/laravel-docker-setup.git
cd laravel-docker-setup
```

### 2. Start Docker and Build Containers

```bash
docker-compose up -d --build
```

### 3. Install Laravel (first time)

📦 Install Laravel inside the `src` folder of the project:

#### Linux / macOS:

```bash
docker run --rm -v $(pwd)/src:/app composer create-project laravel/laravel .
```

#### Windows (PowerShell):

```powershell
docker run --rm -v ${PWD}\src:/app composer create-project laravel/laravel .
```

> ⚠️ Note: If you face the error `Project directory "/app/." is not empty`, make sure the `src` folder is empty or Laravel is not already installed.

### 4. Enter the PHP Container

🔧 Enter the PHP container to run Laravel commands:

```bash
docker exec -it laravel_app bash
```

### 5. Set Up .env File and Application Key

🛠 Before running the migration, create the .env file and set the application key:

```bash
cp .env.example .env
php artisan key:generate
```
Also, make sure the database settings in .env are as follows:

```bash
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=laravel
```



### 6. Set File Permissions

🔐 Permissions for the storage and bootstrap/cache directories need to be set to allow writing:

```bash
chmod -R 775 storage
chmod -R 775 bootstrap/cache
chown -R www-data:www-data storage
chown -R www-data:www-data bootstrap/cache
```

### 7. Run Migration

To run the migration and create the database tables:

```bash
php artisan migrate
```
⚠️ If you are using SQLite, the database/database.sqlite file needs to be created manually or will be created as per the artisan message.

---

## 🌐 Access URLs

- Laravel App: [http://localhost:8080](http://localhost:8080)
- phpMyAdmin: [http://localhost:8081](http://localhost:8081)

### phpMyAdmin login details:

```
Host: mysql
User: root or laravel
Password: root or laravel
```

> The `DB_HOST` value in the `.env` file must be set to `mysql`.

---

## 🧹 Useful Commands

### Stop all containers:

```bash
docker-compose down
```

### View logs:

```bash
docker-compose logs -f
```

---

## 📌 Important Notes

- If you encounter a `Permission Denied` error, check the permissions of the `storage` and `bootstrap/cache` directories.
- If Nginx shows a `File Not Found` page, ensure that the Laravel path is correctly set in `default.conf`.
- You can add a queue worker container if needed.
- If you previously ran the project and received the `container name is already in use` error, use `docker ps -a` to view containers and `docker rm` to remove them.

---

## 🤝 Contributing

If you have suggestions for improving this project, feel free to create a pull request or issue! 🙌

---

## 📜 License

MIT License

---

## 🇮🇷 فارسی

راه‌اندازی سریع پروژه Laravel با Docker شامل PHP, MySQL, Nginx و phpMyAdmin

---

## 📁 ساختار پروژه

```
├── docker
│   └── nginx
│       └── default.conf
├── src
│   └── (Laravel Files)
├── Dockerfile
├── docker-compose.yml
└── README.md
```

---

## ⚙️ پیش‌نیازها

- [Docker](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com/)
- [Composer](https://getcomposer.org/) (در صورت نیاز برای نصب Laravel، اختیاری)

---

## 🚀 مراحل راه‌اندازی

### 1. دریافت پروژه

```bash
git clone git@github.com:siamaknaghel/laravel-docker-setup.git
cd laravel-docker-setup
```


### 2. اجرای Docker و ساخت کانتینرها

```bash
docker-compose up -d --build
```


### 3. نصب Laravel (برای اولین بار)

📦 نصب لاراول داخل مسیر `src` پروژه:

#### لینوکس / macOS:

```bash
docker run --rm -v $(pwd)/src:/app composer create-project laravel/laravel .
```

#### ویندوز (PowerShell):

```powershell
docker run --rm -v ${PWD}\src:/app composer create-project laravel/laravel .
```

> ⚠️ توجه: اگر با ارور `Project directory "/app/." is not empty` مواجه شدی، مطمئن شو که پوشه `src` کاملاً خالیه یا Laravel از قبل توش نصب نشده.


### 4. ورود به کانتینر PHP

🔧 وارد کانتینر PHP بشوید تا دستورات لاراول رو اجرا کنید:

```bash
docker exec -it laravel_app bash
```


### 5. تنظیم فایل `.env` و کلید برنامه

🛠 قبل از اجرای migration، فایل env را بساز و کلید اپلیکیشن را تنظیم کن:

```bash
cp .env.example .env
php artisan key:generate
```

همچنین مطمئن شو که تنظیمات دیتابیس در `.env` به شکل زیر هست:

```
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=laravel
```

### 6. تنظیم دسترسی فایل‌ها

🔐 دسترسی به پوشه‌های `storage` و `bootstrap/cache` برای نوشتن ضروریه:

```bash
chmod -R 775 storage
chmod -R 775 bootstrap/cache
chown -R www-data:www-data storage
chown -R www-data:www-data bootstrap/cache
```


### 7. اجرای migration

برای اعمال migration و ساخت جداول دیتابیس:

```bash
php artisan migrate
```

> ⚠️ اگر از SQLite استفاده می‌کنی، باید فایل `database/database.sqlite` به صورت دستی ایجاد بشه یا طبق پیام artisan ساخته بشه.

---

## 🌐 آدرس‌های دسترسی

- Laravel App: [http://localhost:8080](http://localhost:8080)
- phpMyAdmin: [http://localhost:8081](http://localhost:8081)

### اطلاعات ورود phpMyAdmin:

```
Host: mysql
User: root یا laravel
Password: root یا laravel
```

> مقدار `DB_HOST` در فایل `.env` باید برابر با `mysql` باشد.

---

## 🧹 دستورات کاربردی

### توقف همه کانتینرها:

```bash
docker-compose down
```

### مشاهده لاگ‌ها:

```bash
docker-compose logs -f
```

---

## 📌 نکات مهم

- اگر با ارور `Permission Denied` مواجه شدی، مجوزهای پوشه‌های `storage` و `bootstrap/cache` را بررسی کن.
- اگه صفحه Nginx پیام `File Not Found` نشون داد، مطمئن شو که مسیر Laravel در `default.conf` به درستی ست شده.
- در صورت نیاز می‌تونی یک کانتینر برای queue worker اضافه کنی.
- اگر پروژه رو قبلاً اجرا کرده بودی و ارور `container name is already in use` دریافت کردی، از `docker ps -a` برای دیدن کانتینرها و از `docker rm` برای حذف اون‌ها استفاده کن.

---

## 🤝 مشارکت

اگر پیشنهادی برای بهبود این پروژه داری، خوشحال می‌شیم که Pull Request یا Issue بزنی! 🙌

---

## 📜 لایسنس

MIT License
