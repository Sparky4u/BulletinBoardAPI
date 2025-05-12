CREATE DATABASE BulletinBoardDb;
GO

USE BulletinBoardDb;
GO

-- Створення таблиці оголошень
IF OBJECT_ID('Announcements', 'U') IS NOT NULL
    DROP TABLE Announcements;
GO

CREATE TABLE Announcements (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX),
    CreatedDate DATETIME DEFAULT GETDATE(),
    Status BIT NOT NULL, -- 1 = Активне, 0 = Неактивне
    Category NVARCHAR(50),
    SubCategory NVARCHAR(50)
);
GO

-- Додавання оголошення
IF OBJECT_ID('AddAnnouncement', 'P') IS NOT NULL
    DROP PROCEDURE AddAnnouncement;
GO

CREATE PROCEDURE AddAnnouncement
    @Title NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @Status BIT,
    @Category NVARCHAR(50),
    @SubCategory NVARCHAR(50)
AS
BEGIN
    INSERT INTO Announcements (Title, Description, Status, Category, SubCategory)
    VALUES (@Title, @Description, @Status, @Category, @SubCategory);
END;
GO

-- Отримати всі оголошення
IF OBJECT_ID('GetAllAnnouncements', 'P') IS NOT NULL
    DROP PROCEDURE GetAllAnnouncements;
GO

CREATE PROCEDURE GetAllAnnouncements
AS
BEGIN
    SELECT * FROM Announcements;
END;
GO

-- Оновити оголошення
IF OBJECT_ID('UpdateAnnouncement', 'P') IS NOT NULL
    DROP PROCEDURE UpdateAnnouncement;
GO

CREATE PROCEDURE UpdateAnnouncement
    @Id INT,
    @Title NVARCHAR(100),
    @Description NVARCHAR(MAX),
    @Status BIT,
    @Category NVARCHAR(50),
    @SubCategory NVARCHAR(50)
AS
BEGIN
    UPDATE Announcements
    SET Title = @Title,
        Description = @Description,
        Status = @Status,
        Category = @Category,
        SubCategory = @SubCategory
    WHERE Id = @Id;
END;
GO

-- Видалити оголошення
IF OBJECT_ID('DeleteAnnouncement', 'P') IS NOT NULL
    DROP PROCEDURE DeleteAnnouncement;
GO

CREATE PROCEDURE DeleteAnnouncement
    @Id INT
AS
BEGIN
    DELETE FROM Announcements WHERE Id = @Id;
END;
GO
