USE [master]
GO
/****** Object:  Database [BuSystem]    Script Date: 14.01.2015 21:36:37 ******/
CREATE DATABASE [BuSystem] ON  PRIMARY 
( NAME = N'BuSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BuSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BuSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BuSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BuSystem] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BuSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BuSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BuSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BuSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BuSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BuSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BuSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BuSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BuSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BuSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BuSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BuSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BuSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BuSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BuSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BuSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BuSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BuSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BuSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BuSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BuSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BuSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BuSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BuSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BuSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BuSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BuSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BuSystem] SET DB_CHAINING OFF 
GO
USE [BuSystem]
GO
/****** Object:  StoredProcedure [dbo].[boya]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[boya]
(@citt int,@datss int)
as begin

select * from seat where cityid=@citt and date_id=@datss

end
GO
/****** Object:  StoredProcedure [dbo].[buy1]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buy1]
(@tctct varchar(50))
as begin
select seat_id from seat where seat_tc=@tctct
end
GO
/****** Object:  StoredProcedure [dbo].[buy2]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buy2]
(@tycc nvarchar(50),@dattt int)
as begin
select seat_id from seat where seat_tc=@tycc and date_id=@dattt
end 
GO
/****** Object:  StoredProcedure [dbo].[buy3]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[buy3]
(@t1 nvarchar(50),@t2 nvarchar(50),@t3 nvarchar(50),@t4 nvarchar(50),@t5 nvarchar(50),@t6 nvarchar(50),@t7 nvarchar(50))
as begin 
insert into ticket15 values (@t1, @t2, @t3, @t4, @t5, @t6, @t7)
end 
GO
/****** Object:  StoredProcedure [dbo].[del1]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[del1]
(@tce varchar(50),@datee varchar(50),@seatt varchar(50),@from varchar(50))
as begin
select  TC,Date1,Seat,From_To  from ticket15 where TC=@tce and Date1=@datee and Seat=@seatt and From_To=@from
end
GO
/****** Object:  StoredProcedure [dbo].[del11]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[del11]
(@tce varchar(50),@datee varchar(50),@seatt varchar(50),@from varchar(50))
as begin
select  TC,Date,Seat,From_To  from ticket15 where TC=@tce and Date=@datee and Seat=@seatt and From_To=@from
end
GO
/****** Object:  StoredProcedure [dbo].[del2]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[del2]
(@tccc varchar(50), @dateo varchar(50),@se varchar(50) ,@cit nvarchar(50))
as begin
select seat_id,seat_tc,date_name,cityname from seat where seat_tc=@tccc and date_name=@dateo and seat_id=@se and cityname=@cit
end
GO
/****** Object:  StoredProcedure [dbo].[del3]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[del3] 
(@sss nvarchar(50), @tcccc nvarchar(50),@dateoo varchar(50),@citoo varchar(50) )
as begin 
delete from seat where seat_id=@sss and seat_tc=@tcccc and date_name=@dateoo and cityname=@citoo
end 
GO
/****** Object:  StoredProcedure [dbo].[insertSeat]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertSeat]
(@b varchar(50),@tc11 varchar(50),@genderr varchar(50),@cityid int ,@dateid int, @datename varchar(50),@cityname varchar(50))
as begin 
insert into seat values(@b,@tc11,@genderr,@cityid,@dateid,@datename,@cityname) 
END
GO
/****** Object:  StoredProcedure [dbo].[insertSeat1]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertSeat1]
(@b int,@tc11 varchar(50),@genderr varchar(50),@cityid int ,@dateid int, @datename varchar(50),@cityname varchar(50))
AS BEGIN 
insert into seat values(@b,@tc11,@genderr,@cityid,@dateid,@datename,@cityname) 
END
GO
/****** Object:  StoredProcedure [dbo].[insertSeat12]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertSeat12]
(@b varchar(50),@tc11 varchar(50),@genderr varchar(50),@city_id int ,@date_id int, @datename varchar(50),@city_name varchar(50))
as begin 
insert into seat values(@b,@tc11,@genderr,@city_id,@date_id,@datename,@city_name) 
END
GO
/****** Object:  StoredProcedure [dbo].[requestt]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[requestt]
(@tcy varchar(50), @message varchar(50))
as begin
insert into request values (@tcy,@message)
end
GO
/****** Object:  StoredProcedure [dbo].[searchPer]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[searchPer]
(@idi varchar(50))
as begin 
select P_gender,P_name,P_surname from person  where P_id=@idi
end
GO
/****** Object:  StoredProcedure [dbo].[selectCity]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectCity]
as
begin
select * from city
end
GO
/****** Object:  StoredProcedure [dbo].[selectDate]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectDate]
as
begin
select * from Sefer
end
GO
/****** Object:  StoredProcedure [dbo].[selectper]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[selectper]
(@tcc varchar(50))
AS BEGIN
SELECT P_gender from person  where P_id=@tcc
END
GO
/****** Object:  StoredProcedure [dbo].[selectPerson]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectPerson]
as
begin
select * from person
end
GO
/****** Object:  StoredProcedure [dbo].[selectSeat]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectSeat]
as
begin
SELECT * FROM seat 
end
GO
/****** Object:  StoredProcedure [dbo].[selectTicket15]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectTicket15]
(@tc varchar(50))
as
begin
SELECT * FROM ticket15 WHERE TC=@tc
end
GO
/****** Object:  StoredProcedure [dbo].[selectTickett]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectTickett]
(@tc varchar(50))
as
begin
SELECT * FROM tickett WHERE TC=@tc
end
GO
/****** Object:  StoredProcedure [dbo].[spDeletePerson]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeletePerson]
(@id varchar(50),@pass varchar(50))
as
begin
delete from person where P_id=@id and P_password=@pass 
end
GO
/****** Object:  StoredProcedure [dbo].[spInsertPerson]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertPerson]
(@id varchar(20), @name varchar(50), @surname varchar(50), @gender varchar(50), @date varchar(50), @phone varchar(50), @mail varchar(50), @pssw varchar(50))
as
begin
insert into person values(@id,@name,@surname,@gender,@date,@phone,@mail,@pssw )
end
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spLogin]
(@id varchar(20), @pssw varchar(50))
as
begin
select P_id , P_password from person where P_id=@id and P_password=@pssw 
end

GO
/****** Object:  StoredProcedure [dbo].[spUpdatePerson]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spUpdatePerson]
(@pasnew varchar(50),@id varchar(50),@pas varchar(50))
as
begin
update person set P_password=@pasnew where  @id=P_id and @pas=P_password 
end

GO
/****** Object:  StoredProcedure [dbo].[ss]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ss]
(@sd varchar(50))
as begin 

select * from person where P_id=@sd
end
GO
/****** Object:  StoredProcedure [dbo].[sss]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sss]
(@sdd varchar(50))
as begin 

delete from ticket15 where TC=@sdd
end
GO
/****** Object:  StoredProcedure [dbo].[ssss]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ssss]
(@sddd varchar(50))
as begin 

delete from person where P_id=@sddd
end
GO
/****** Object:  StoredProcedure [dbo].[sssss]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sssss]

as begin 

select * from ticket15
end
GO
/****** Object:  StoredProcedure [dbo].[ssssss]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ssssss]
(@uu varchar(50))
as begin 

insert into city values (@uu) 
end
GO
/****** Object:  StoredProcedure [dbo].[vieww]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[vieww]
as begin 

select * from wew
end
GO
/****** Object:  Table [dbo].[branch]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch](
	[branch_id] [int] IDENTITY(1,1) NOT NULL,
	[city_id] [int] NOT NULL,
	[branch_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_branch_1] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bus]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bus](
	[bus_plaka] [nvarchar](10) NOT NULL,
	[koltuk_say] [int] NULL,
	[Marka_id] [int] NULL,
	[bus_aktif] [bit] NULL,
 CONSTRAINT [PK_bus] PRIMARY KEY CLUSTERED 
(
	[bus_plaka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bus_brand]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bus_brand](
	[marka_id] [int] IDENTITY(1,1) NOT NULL,
	[marka_name] [nvarchar](50) NULL,
	[bus_id] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_bus_brand] PRIMARY KEY CLUSTERED 
(
	[marka_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bus1]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bus1](
	[bus_id] [int] NOT NULL,
	[bus_driver] [nvarchar](50) NULL,
	[bus_muavin] [nvarchar](50) NULL,
	[bus_marka] [nvarchar](50) NULL,
	[bus_model] [nvarchar](50) NULL,
	[bus_date] [int] NOT NULL,
 CONSTRAINT [PK_bus1_1] PRIMARY KEY CLUSTERED 
(
	[bus_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[city]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[person]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[P_id] [nvarchar](50) NOT NULL,
	[P_name] [nvarchar](50) NULL,
	[P_surname] [nvarchar](50) NULL,
	[P_gender] [nvarchar](50) NULL,
	[P_bdate] [nvarchar](50) NULL,
	[P_phone] [nvarchar](50) NULL,
	[P_email] [nvarchar](50) NULL,
	[P_password] [nchar](10) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[P_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[r1]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[r1](
	[Pid] [nvarchar](50) NOT NULL,
	[message] [nvarchar](50) NULL,
 CONSTRAINT [PK_r1] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[r2]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[r2](
	[Pid] [nvarchar](50) NOT NULL,
	[message] [nvarchar](50) NULL,
 CONSTRAINT [PK_r2] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[re]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[re](
	[Message_id] [int] IDENTITY(1,1) NOT NULL,
	[message] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[seat]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seat](
	[seat_id] [nvarchar](50) NOT NULL,
	[seat_tc] [nvarchar](50) NULL,
	[seat_gender] [nvarchar](50) NULL,
	[cityid] [int] NULL,
	[date_id] [int] NULL,
	[date_name] [nvarchar](50) NULL,
	[cityname] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sefer]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sefer](
	[date_id] [int] IDENTITY(1,1) NOT NULL,
	[date_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sefer] PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ticket15]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket15](
	[TC] [nvarchar](50) NULL,
	[From_To] [nvarchar](50) NULL,
	[Date] [nvarchar](50) NULL,
	[Time] [nvarchar](50) NULL,
	[Take-off Area] [nvarchar](50) NULL,
	[Price] [nvarchar](50) NULL,
	[Seat] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_type]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_type](
	[p_id] [nvarchar](50) NOT NULL,
	[user_type] [int] NOT NULL,
 CONSTRAINT [PK_kullanıcı_tipi] PRIMARY KEY CLUSTERED 
(
	[user_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[voyage]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voyage](
	[voyage_id] [nvarchar](50) NOT NULL,
	[kalkis_sehid] [int] NULL,
	[varis_sehid] [int] NULL,
	[bus_plaka] [nvarchar](10) NOT NULL,
	[sofor_id] [nvarchar](50) NULL,
	[muavin_id] [nvarchar](50) NULL,
	[from_time] [nvarchar](50) NULL,
	[to_time] [nvarchar](50) NULL,
	[avarage_time] [nvarchar](50) NULL,
	[ticket_price] [int] NULL,
 CONSTRAINT [PK_voyage] PRIMARY KEY CLUSTERED 
(
	[voyage_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[worker]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[worker](
	[salary_id] [nchar](10) NOT NULL,
	[worker_name] [nchar](10) NULL,
	[workers_id] [nvarchar](50) NOT NULL,
	[works_month] [int] NULL,
	[salary] [int] NULL,
 CONSTRAINT [PK_worker] PRIMARY KEY CLUSTERED 
(
	[salary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[wew]    Script Date: 14.01.2015 21:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[wew]
AS
SELECT        dbo.re.message, dbo.re.Message_id, dbo.r1.Pid
FROM            dbo.r1 INNER JOIN
                         dbo.re ON dbo.r1.message = dbo.re.message

GO
ALTER TABLE [dbo].[branch]  WITH CHECK ADD  CONSTRAINT [FK_branch_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([c_id])
GO
ALTER TABLE [dbo].[branch] CHECK CONSTRAINT [FK_branch_city]
GO
ALTER TABLE [dbo].[bus_brand]  WITH CHECK ADD  CONSTRAINT [FK_bus_brand_bus] FOREIGN KEY([bus_id])
REFERENCES [dbo].[bus] ([bus_plaka])
GO
ALTER TABLE [dbo].[bus_brand] CHECK CONSTRAINT [FK_bus_brand_bus]
GO
ALTER TABLE [dbo].[seat]  WITH CHECK ADD  CONSTRAINT [FK_seat_city] FOREIGN KEY([cityid])
REFERENCES [dbo].[city] ([c_id])
GO
ALTER TABLE [dbo].[seat] CHECK CONSTRAINT [FK_seat_city]
GO
ALTER TABLE [dbo].[seat]  WITH CHECK ADD  CONSTRAINT [FK_seat_person] FOREIGN KEY([seat_tc])
REFERENCES [dbo].[person] ([P_id])
GO
ALTER TABLE [dbo].[seat] CHECK CONSTRAINT [FK_seat_person]
GO
ALTER TABLE [dbo].[seat]  WITH CHECK ADD  CONSTRAINT [FK_seat_Sefer] FOREIGN KEY([date_id])
REFERENCES [dbo].[Sefer] ([date_id])
GO
ALTER TABLE [dbo].[seat] CHECK CONSTRAINT [FK_seat_Sefer]
GO
ALTER TABLE [dbo].[user_type]  WITH CHECK ADD  CONSTRAINT [FK_user_type_person] FOREIGN KEY([p_id])
REFERENCES [dbo].[person] ([P_id])
GO
ALTER TABLE [dbo].[user_type] CHECK CONSTRAINT [FK_user_type_person]
GO
ALTER TABLE [dbo].[voyage]  WITH CHECK ADD  CONSTRAINT [FK_voyage_bus] FOREIGN KEY([bus_plaka])
REFERENCES [dbo].[bus] ([bus_plaka])
GO
ALTER TABLE [dbo].[voyage] CHECK CONSTRAINT [FK_voyage_bus]
GO
ALTER TABLE [dbo].[voyage]  WITH CHECK ADD  CONSTRAINT [FK_voyage_city] FOREIGN KEY([kalkis_sehid])
REFERENCES [dbo].[city] ([c_id])
GO
ALTER TABLE [dbo].[voyage] CHECK CONSTRAINT [FK_voyage_city]
GO
ALTER TABLE [dbo].[voyage]  WITH CHECK ADD  CONSTRAINT [FK_voyage_city1] FOREIGN KEY([varis_sehid])
REFERENCES [dbo].[city] ([c_id])
GO
ALTER TABLE [dbo].[voyage] CHECK CONSTRAINT [FK_voyage_city1]
GO
ALTER TABLE [dbo].[voyage]  WITH CHECK ADD  CONSTRAINT [FK_voyage_person] FOREIGN KEY([sofor_id])
REFERENCES [dbo].[person] ([P_id])
GO
ALTER TABLE [dbo].[voyage] CHECK CONSTRAINT [FK_voyage_person]
GO
ALTER TABLE [dbo].[voyage]  WITH CHECK ADD  CONSTRAINT [FK_voyage_person1] FOREIGN KEY([muavin_id])
REFERENCES [dbo].[person] ([P_id])
GO
ALTER TABLE [dbo].[voyage] CHECK CONSTRAINT [FK_voyage_person1]
GO
ALTER TABLE [dbo].[worker]  WITH CHECK ADD  CONSTRAINT [FK_worker_person] FOREIGN KEY([workers_id])
REFERENCES [dbo].[person] ([P_id])
GO
ALTER TABLE [dbo].[worker] CHECK CONSTRAINT [FK_worker_person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "r1"
            Begin Extent = 
               Top = 37
               Left = 39
               Bottom = 130
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "re"
            Begin Extent = 
               Top = 4
               Left = 418
               Bottom = 97
               Right = 588
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1860
         Width = 1890
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'wew'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'wew'
GO
USE [master]
GO
ALTER DATABASE [BuSystem] SET  READ_WRITE 
GO
