# 🧩 BulletinBoard API

Це серверна частина (RESTful API) проєкту **Bulletin Board**, реалізована на ASP.NET Core 9. API надає повний CRUD функціонал для управління оголошеннями та працює через збережені процедури у MS SQL Server.

---

## 📦 Технології

- ASP.NET Core 9 Web API
- Entity Framework Core (з `FromSqlRaw`)
- MS SQL Server + Stored Procedures
- Azure App Service (деплой)
- Azure API Management (опційно)

---

## 📂 Структура проєкту
BulletinBoardAPI/
│
├── Controllers/
│ └── AnnouncementsController.cs
│
├── Models/
│ └── Announcement.cs
│
├── Data/
│ └── ApplicationDbContext.cs
│
└── appsettings.json
│
└── Program.cs

