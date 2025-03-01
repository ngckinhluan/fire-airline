USE [master]
GO
/****** Object:  Database [FlightBooking]    Script Date: 10/26/2023 2:12:41 PM ******/
CREATE DATABASE [FlightBooking]
GO
ALTER DATABASE [FlightBooking] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlightBooking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlightBooking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlightBooking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlightBooking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlightBooking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlightBooking] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlightBooking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlightBooking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlightBooking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlightBooking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlightBooking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlightBooking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlightBooking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlightBooking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlightBooking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlightBooking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlightBooking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlightBooking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlightBooking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlightBooking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlightBooking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlightBooking] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlightBooking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlightBooking] SET RECOVERY FULL 
GO
ALTER DATABASE [FlightBooking] SET  MULTI_USER 
GO
ALTER DATABASE [FlightBooking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlightBooking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlightBooking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlightBooking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlightBooking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlightBooking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlightBooking', N'ON'
GO
ALTER DATABASE [FlightBooking] SET QUERY_STORE = ON
GO
ALTER DATABASE [FlightBooking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FlightBooking]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 10/26/2023 2:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[seats] [int] NULL,
	[departureTime] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[destination] [varchar](100) NULL,
	[arrivalTime] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 10/26/2023 2:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NULL,
	[FlightId] [int] NULL,
	[seatNumber] [int] NULL,
	[bookedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/26/2023 2:12:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](100) NOT NULL,
	[dob] [date] NULL,
	[email] [varchar](320) NULL,
	[full_name] [varchar](100) NULL,
	[gender] [int] NULL,
	[password] [varchar](100) NULL,
	[role] [int] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET IDENTITY_INSERT [dbo].[Flight] ON 

INSERT [dbo].[Flight] ([id], [seats], [departureTime], [source], [destination], [arrivalTime]) VALUES (1, 45, N'08:30 AM', N'Hanoi', N'Ho Chi Minh City', N'03:30 PM')
INSERT [dbo].[Flight] ([id], [seats], [departureTime], [source], [destination], [arrivalTime]) VALUES (2, 30, N'10:00 AM', N'Hanoi', N'Da Nang', N'04:30 PM')
INSERT [dbo].[Flight] ([id], [seats], [departureTime], [source], [destination], [arrivalTime]) VALUES (3, 40, N'09:00 AM', N'Hanoi', N'Nha Trang', N'05:00 PM')
INSERT INTO [dbo].[Flight] ([id], [seats], [departureTime], [source], [destination], [arrivalTime]) 
VALUES 
(4, 50, '07:00 AM', 'Da Nang', 'Hanoi', '09:30 AM'),
(5, 55, '08:00 AM', 'Nha Trang', 'Da Nang', '10:45 AM'),
(6, 60, '09:30 AM', 'Ho Chi Minh City', 'Hanoi', '12:00 PM'),
(7, 45, '11:00 AM', 'Hanoi', 'Ho Chi Minh City', '01:30 PM'),
(8, 30, '12:00 PM', 'Hanoi', 'Da Nang', '02:30 PM'),
(9, 40, '01:00 PM', 'Hanoi', 'Nha Trang', '03:00 PM'),
(10, 50, '02:00 PM', 'Da Nang', 'Hanoi', '04:30 PM'),
(11, 55, '03:00 PM', 'Nha Trang', 'Da Nang', '05:45 PM'),
(12, 60, '04:30 PM', 'Ho Chi Minh City', 'Hanoi', '07:00 PM'),
(13, 45, '06:00 PM', 'Hanoi', 'Ho Chi Minh City', '08:30 PM'),
(14, 50, '07:15 AM', 'Hanoi', 'Phu Quoc', '09:45 AM'),
(15, 60, '08:20 AM', 'Phu Quoc', 'Hanoi', '10:50 AM'),
(16, 55, '09:25 AM', 'Ho Chi Minh City', 'Da Nang', '11:55 AM'),
(17, 45, '10:30 AM', 'Da Nang', 'Ho Chi Minh City', '12:00 PM'),
(18, 65, '11:35 AM', 'Hanoi', 'Can Tho', '02:05 PM'),
(19, 70, '12:40 PM', 'Can Tho', 'Hanoi', '03:10 PM'),
(20, 75, '01:45 PM', 'Hanoi', 'Da Nang', '03:15 PM'),
(21, 80, '02:50 PM', 'Da Nang', 'Hanoi', '04:20 PM'),
(22, 85, '03:55 PM', 'Ho Chi Minh City', 'Phu Quoc', '05:25 PM'),
(23, 90, '04:00 PM', 'Phu Quoc', 'Ho Chi Minh City', '05:30 PM'),
(24, 95, '05:05 PM', 'Hanoi', 'Nha Trang', '07:35 PM'),
(25, 100, '06:10 PM', 'Nha Trang', 'Hanoi', '08:40 PM'),
(26, 55, '07:15 PM', 'Da Nang', 'Phu Quoc', '09:45 PM'),
(27, 60, '08:20 PM', 'Phu Quoc', 'Da Nang', '10:50 PM'),
(28, 65, '05:25 AM', 'Hanoi', 'Ho Chi Minh City', '07:55 AM'),
(29, 70, '06:30 AM', 'Ho Chi Minh City', 'Hanoi', '08:00 AM'),
(30, 75, '07:35 AM', 'Hanoi', 'Da Nang', '09:05 AM'),
(31, 80, '08:40 AM', 'Da Nang', 'Hanoi', '10:10 AM'),
(32, 85, '09:45 AM', 'Ho Chi Minh City', 'Nha Trang', '11:15 AM'),
(33, 90, '10:50 AM', 'Nha Trang', 'Ho Chi Minh City', '12:20 PM'),
(34, 95, '11:55 AM', 'Hanoi', 'Can Tho', '02:25 PM'),
(35, 100, '01:00 PM', 'Can Tho', 'Hanoi', '03:30 PM'),
(36, 55, '02:05 PM', 'Hanoi', 'Phu Quoc', '04:35 PM'),
(37, 60, '03:10 PM', 'Phu Quoc', 'Hanoi', '05:40 PM'),
(38, 65, '04:15 PM', 'Da Nang', 'Ho Chi Minh City', '05:45 PM'),
(39, 70, '05:20 PM', 'Ho Chi Minh City', 'Da Nang', '06:50 PM'),
(40, 75, '06:25 PM', 'Hanoi', 'Da Nang', '07:55 PM'),
(41, 80, '07:30 PM', 'Da Nang', 'Hanoi', '08:00 PM'),
(42, 85, '08:35 PM', 'Ho Chi Minh City', 'Phu Quoc', '10:05 PM'),
(43, 90, '09:40 PM', 'Phu Quoc', 'Ho Chi Minh City', '11:10 PM'),
(44, 50, '07:30 AM', 'Hanoi', 'Phu Quoc', '10:00 AM'),
(45, 60, '08:45 AM', 'Phu Quoc', 'Hanoi', '11:15 AM'),
(46, 55, '09:50 AM', 'Ho Chi Minh City', 'Da Nang', '11:20 AM'),
(47, 45, '10:55 AM', 'Da Nang', 'Ho Chi Minh City', '12:25 PM'),
(48, 65, '12:00 PM', 'Hanoi', 'Can Tho', '02:30 PM'),
(49, 70, '01:05 PM', 'Can Tho', 'Hanoi', '03:35 PM'),
(50, 75, '02:10 PM', 'Hanoi', 'Da Nang', '03:40 PM'),
(51, 80, '03:15 PM', 'Da Nang', 'Hanoi', '04:45 PM'),
(52, 85, '04:20 PM', 'Ho Chi Minh City', 'Phu Quoc', '05:50 PM'),
(53, 90, '05:25 PM', 'Phu Quoc', 'Ho Chi Minh City', '06:55 PM'),
(54, 95, '06:30 PM', 'Hanoi', 'Nha Trang', '08:00 PM'),
(55, 100, '07:35 PM', 'Nha Trang', 'Hanoi', '09:05 PM'),
(56, 55, '08:40 PM', 'Da Nang', 'Phu Quoc', '10:10 PM'),
(57, 60, '09:45 PM', 'Phu Quoc', 'Da Nang', '11:15 PM'),
(58, 65, '05:30 AM', 'Hanoi', 'Ho Chi Minh City', '07:00 AM'),
(59, 70, '06:35 AM', 'Ho Chi Minh City', 'Hanoi', '08:05 AM'),
(60, 75, '07:40 AM', 'Hanoi', 'Da Nang', '09:10 AM'),
(61, 80, '08:45 AM', 'Da Nang', 'Hanoi', '10:15 AM'),
(62, 85, '09:50 AM', 'Ho Chi Minh City', 'Nha Trang', '11:20 AM'),
(63, 90, '10:55 AM', 'Nha Trang', 'Ho Chi Minh City', '12:25 PM'),
(64, 95, '12:00 PM', 'Hanoi', 'Can Tho', '02:30 PM'),
(65, 100, '01:05 PM', 'Can Tho', 'Hanoi', '03:35 PM'),
(66, 55, '02:10 PM', 'Hanoi', 'Phu Quoc', '04:40 PM'),
(67, 60, '03:15 PM', 'Phu Quoc', 'Hanoi', '05:45 PM'),
(68, 65, '04:20 PM', 'Da Nang', 'Ho Chi Minh City', '05:50 PM'),
(69, 70, '05:25 PM', 'Ho Chi Minh City', 'Da Nang', '06:55 PM'),
(70, 75, '06:30 PM', 'Hanoi', 'Da Nang', '08:00 PM'),
(71, 80, '07:35 PM', 'Da Nang', 'Hanoi', '09:05 PM'),
(72, 85, '08:40 PM', 'Ho Chi Minh City', 'Phu Quoc', '10:10 PM'),
(73, 90, '09:45 PM', 'Phu Quoc', 'Ho Chi Minh City', '11:15 PM'),
(74, 50, '06:00 AM', 'Hanoi', 'Da Nang', '07:30 AM'),
(75, 55, '06:30 AM', 'Da Nang', 'Hanoi', '08:00 AM'),
(76, 60, '07:00 AM', 'Hanoi', 'Nha Trang', '08:45 AM'),
(77, 65, '07:30 AM', 'Nha Trang', 'Hanoi', '09:15 AM'),
(78, 70, '08:00 AM', 'Hanoi', 'Ho Chi Minh City', '09:45 AM'),
(79, 75, '08:30 AM', 'Ho Chi Minh City', 'Hanoi', '10:15 AM'),
(80, 80, '09:00 AM', 'Hanoi', 'Phu Quoc', '10:50 AM'),
(81, 85, '09:30 AM', 'Phu Quoc', 'Hanoi', '11:20 AM'),
(82, 90, '10:00 AM', 'Hanoi', 'Da Nang', '11:45 AM'),
(83, 95, '10:30 AM', 'Da Nang', 'Hanoi', '12:15 PM'),
(84, 100, '11:00 AM', 'Hanoi', 'Nha Trang', '12:45 PM'),
(85, 105, '11:30 AM', 'Nha Trang', 'Hanoi', '01:15 PM'),
(86, 110, '12:00 PM', 'Hanoi', 'Ho Chi Minh City', '01:45 PM'),
(87, 115, '12:30 PM', 'Ho Chi Minh City', 'Hanoi', '02:15 PM'),
(88, 120, '01:00 PM', 'Hanoi', 'Phu Quoc', '02:50 PM'),
(89, 125, '01:30 PM', 'Phu Quoc', 'Hanoi', '03:20 PM'),
(90, 130, '02:00 PM', 'Hanoi', 'Da Nang', '03:45 PM'),
(91, 135, '02:30 PM', 'Da Nang', 'Hanoi', '04:15 PM'),
(92, 140, '03:00 PM', 'Hanoi', 'Nha Trang', '04:45 PM'),
(93, 145, '03:30 PM', 'Nha Trang', 'Hanoi', '05:15 PM'),
(94, 150, '04:00 PM', 'Hanoi', 'Ho Chi Minh City', '05:45 PM'),
(95, 155, '04:30 PM', 'Ho Chi Minh City', 'Hanoi', '06:15 PM'),
(96, 160, '05:00 PM', 'Hanoi', 'Phu Quoc', '06:50 PM'),
(97, 165, '05:30 PM', 'Phu Quoc', 'Hanoi', '07:20 PM'),
(98, 170, '06:00 PM', 'Hanoi', 'Da Nang', '07:45 PM'),
(99, 175, '06:30 PM', 'Da Nang', 'Hanoi', '08:15 PM'),
(100, 180, '07:00 PM', 'Hanoi', 'Nha Trang', '08:45 PM'),
(101, 185, '07:30 PM', 'Nha Trang', 'Hanoi', '09:15 PM'),
(102, 190, '08:00 PM', 'Hanoi', 'Ho Chi Minh City', '09:45 PM'),
(103, 195, '08:30 PM', 'Ho Chi Minh City', 'Hanoi', '10:15 PM');


SET IDENTITY_INSERT [dbo].[Flight] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket] ON 

INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (7, N'Aline', 1, 1, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (8, N'Branden', 1, 2, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (9, N'Chiquita', 2, 1, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (10, N'Christian', 2, 2, CAST(N'2023-10-26' AS Date))
INSERT [dbo].[ticket] ([id], [username], [FlightId], [seatNumber], [bookedDate]) VALUES (11, N'Clio', 3, 1, CAST(N'2023-10-26' AS Date))



SET IDENTITY_INSERT [dbo].[ticket] OFF
GO
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [status]) VALUES (N'admin', CAST(N'2023-05-26' AS Date), N'malesuada@hotmail.net', N'Castor', 0, N'21232f297a57a5a743894a0e4a801fc3', 0,  1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role],  [status]) VALUES (N'Aline', CAST(N'2023-07-19' AS Date), N'phasellus.dolor@yahoo.org', N'Kadeem', 0, N'202cb962ac59075b964b07152d234b70', 0, 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role],  [status]) VALUES (N'Branden', CAST(N'2023-08-15' AS Date), N'consequat.purus@google.com', N'Yuli', 0, N'202cb962ac59075b964b07152d234b70', 0, 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role], [status]) VALUES (N'Chiquita', CAST(N'2023-04-29' AS Date), N'tellus.justo.sit@google.com', N'Ulysses', 1, N'202cb962ac59075b964b07152d234b70', 0, 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role],  [status]) VALUES (N'Christian', CAST(N'2023-05-26' AS Date), N'eu.erat@google.net', N'Damian', 0, N'202cb962ac59075b964b07152d234b70', 0, 1)
INSERT [dbo].[Users] ([username], [dob], [email], [full_name], [gender], [password], [role],  [status]) VALUES (N'Clio', CAST(N'2023-08-17' AS Date), N'fusce@icloud.com', N'Elvis Nam', 0, N'e10adc3949ba59abbe56e057f20f883e', 0, 1)


GO
ALTER TABLE [dbo].[ticket] ADD  DEFAULT (getdate()) FOR [bookedDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [role]
GO

ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
ALTER TABLE [dbo].[ticket]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Users] ([username])
GO
USE [master]
GO
ALTER DATABASE [FlightBooking] SET  READ_WRITE 
GO
