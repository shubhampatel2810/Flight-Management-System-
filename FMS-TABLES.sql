USE [FMG]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportID] [int] NOT NULL,
	[AirportCode] [varchar](3) NOT NULL,
	[AirportName] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
	[Timezone] [datetimeoffset](7) NULL,
	[Terminal] [varchar](50) NOT NULL,
	[Gates] [int] NOT NULL,
	[Services] [varchar](max) NULL,
	[ContactInfo] [varchar](max) NULL,
 CONSTRAINT [PKAirportID] PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calendars]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendars](
	[Date] [date] NOT NULL,
	[DayofWeek] [varchar](20) NULL,
	[FlightID] [int] NOT NULL,
	[Availability] [varchar](3) NULL,
	[BlackoutDate] [varchar](3) NULL,
 CONSTRAINT [PK_Calendars] PRIMARY KEY CLUSTERED 
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightCosts]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightCosts](
	[CostID] [int] NOT NULL,
	[FlightID] [int] NOT NULL,
	[BaseFare] [decimal](18, 2) NOT NULL,
	[Tax] [decimal](18, 2) NULL,
	[Fees] [decimal](18, 2) NULL,
	[TotalCost]  AS ((isnull([BaseFare],(0))+isnull([Tax],(0)))+isnull([Fees],(0))),
 CONSTRAINT [PK_FlightCosts] PRIMARY KEY CLUSTERED 
(
	[CostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightDetails]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightDetails](
	[FlightID] [int] NOT NULL,
	[FlightNumber] [varchar](20) NOT NULL,
	[AirportID] [int] NOT NULL,
	[DepartureAirportCode] [varchar](3) NOT NULL,
	[ArrivalAirportCode] [varchar](3) NOT NULL,
	[DepartureTime] [datetime] NULL,
	[ArrivalTime] [datetime] NULL,
	[AircraftType] [varchar](50) NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_FlightDetails] PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FlightServices]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlightServices](
	[ServiceID] [int] NOT NULL,
	[FlightID] [int] NOT NULL,
	[MealOffered] [varchar](3) NULL,
	[Entertainment] [varchar](3) NULL,
	[WiFiAvailability] [varchar](3) NULL,
	[OtherServices] [varchar](max) NULL,
 CONSTRAINT [PK_FlightServices] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passengers]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passengers](
	[PassengerID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[Gender] [char](1) NULL,
	[Nationality] [varchar](50) NULL,
	[PassportNumber] [varchar](20) NOT NULL,
	[Email] [varchar](100) NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Address] [varchar](max) NULL,
	[FrequentFlyerNumber] [varchar](20) NULL,
	[EmergencyContact] [varchar](100) NULL,
	[MembershipLevel] [varchar](50) NULL,
	[MembershipNumber] [varchar](20) NULL,
 CONSTRAINT [PK_PassengersID] PRIMARY KEY CLUSTERED 
(
	[PassengerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[TransactionID] [varchar](50) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentStatus]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatus](
	[StatusID] [int] NOT NULL,
	[PaymentID] [int] NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[StatusDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentsTypes]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentsTypes](
	[PaymentMethodID] [int] NOT NULL,
	[PaymentUsing] [varchar](50) NULL,
	[Desc] [varchar](max) NULL,
 CONSTRAINT [PK_PaymentsTypes] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] NOT NULL,
	[PassengerID] [int] NOT NULL,
	[FlightID] [int] NOT NULL,
	[SeatID] [int] NOT NULL,
	[BookingDate] [datetime] NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatDetails]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatDetails](
	[SeatID] [int] NOT NULL,
	[FlightID] [int] NOT NULL,
	[SeatNumber] [varchar](10) NOT NULL,
	[Class] [varchar](20) NOT NULL,
	[Availability] [varchar](20) NOT NULL,
 CONSTRAINT [PK_SeatDetails] PRIMARY KEY CLUSTERED 
(
	[SeatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceOfferings]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOfferings](
	[ServiceID] [int] NOT NULL,
	[ServiceName] [varchar](100) NOT NULL,
	[Description] [varchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[Availability] [varchar](3) NULL,
 CONSTRAINT [PK_ServiceOfferings] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TravelClasses]    Script Date: 3/29/2024 7:47:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TravelClasses](
	[ClassID] [int] NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[Description] [varchar](max) NULL,
	[SeatType] [varchar](50) NULL,
	[Pricing] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TravelClasses] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Calendars]  WITH CHECK ADD  CONSTRAINT [FK_Calendars_FlightID_FlightDetails] FOREIGN KEY([FlightID])
REFERENCES [dbo].[FlightDetails] ([FlightID])
GO
ALTER TABLE [dbo].[Calendars] CHECK CONSTRAINT [FK_Calendars_FlightID_FlightDetails]
GO
ALTER TABLE [dbo].[FlightCosts]  WITH CHECK ADD  CONSTRAINT [FK_FlightCosts_FlightDetails] FOREIGN KEY([FlightID])
REFERENCES [dbo].[FlightDetails] ([FlightID])
GO
ALTER TABLE [dbo].[FlightCosts] CHECK CONSTRAINT [FK_FlightCosts_FlightDetails]
GO
ALTER TABLE [dbo].[FlightServices]  WITH CHECK ADD  CONSTRAINT [FK_FlightServices_FlightID_FlightDetails] FOREIGN KEY([FlightID])
REFERENCES [dbo].[FlightDetails] ([FlightID])
GO
ALTER TABLE [dbo].[FlightServices] CHECK CONSTRAINT [FK_FlightServices_FlightID_FlightDetails]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentMethod_PaymentsTypes] FOREIGN KEY([PaymentMethod])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentMethod_PaymentsTypes]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_ReservationID_Reservations] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[Reservations] ([ReservationID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_ReservationID_Reservations]
GO
ALTER TABLE [dbo].[PaymentStatus]  WITH CHECK ADD  CONSTRAINT [FK_PaymentStatus_PaymentID_Payments] FOREIGN KEY([PaymentID])
REFERENCES [dbo].[Payments] ([PaymentID])
GO
ALTER TABLE [dbo].[PaymentStatus] CHECK CONSTRAINT [FK_PaymentStatus_PaymentID_Payments]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_FlightID_FlightDetails] FOREIGN KEY([FlightID])
REFERENCES [dbo].[FlightDetails] ([FlightID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_FlightID_FlightDetails]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_PassengerID_Passengers] FOREIGN KEY([PassengerID])
REFERENCES [dbo].[Passengers] ([PassengerID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_PassengerID_Passengers]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_SeatID_SeatDetails] FOREIGN KEY([SeatID])
REFERENCES [dbo].[SeatDetails] ([SeatID])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_SeatID_SeatDetails]
GO
ALTER TABLE [dbo].[SeatDetails]  WITH CHECK ADD  CONSTRAINT [FK_SeatDetails_SeatID_FlightDetails] FOREIGN KEY([FlightID])
REFERENCES [dbo].[FlightDetails] ([FlightID])
GO
ALTER TABLE [dbo].[SeatDetails] CHECK CONSTRAINT [FK_SeatDetails_SeatID_FlightDetails]
GO
