USE [TuCitaApp]
GO
/****** Object:  Table [dbo].[Centro_Medico]    Script Date: 8/22/2020 10:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centro_Medico](
	[Numero_Centro_Medico] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Centro_Medico] [varchar](500) NOT NULL,
	[Direccion_Centro_Medico] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Centro_Medico] PRIMARY KEY CLUSTERED 
(
	[Numero_Centro_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 8/22/2020 10:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[Numero_De_Cita] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Persona] [int] NOT NULL,
	[Numero_Centro_Medico] [int] NOT NULL,
	[Numero_Doctor] [int] NOT NULL,
	[Fecha_Cita] [datetime] NOT NULL,
	[Razon_Cita] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[Numero_De_Cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credenciales_Usuario]    Script Date: 8/22/2020 10:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credenciales_Usuario](
	[Numero_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Persona] [int] NOT NULL,
	[Nombre_Usuario] [varchar](50) NOT NULL,
	[Contraseña_Usuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credenciales_Usuario] PRIMARY KEY CLUSTERED 
(
	[Numero_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 8/22/2020 10:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Numero_Doctor] [int] IDENTITY(1,1) NOT NULL,
	[Numero_Centro_Medico] [int] NOT NULL,
	[Nombre_Doctor] [varchar](100) NOT NULL,
	[Exequatur] [int] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Numero_Doctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 8/22/2020 10:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Numero_Persona] [int] IDENTITY(1,1) NOT NULL,
	[Cedula_Persona] [varchar](11) NOT NULL,
	[Nombre_Persona] [varchar](500) NOT NULL,
	[Edad_Persona] [tinyint] NOT NULL,
	[Sexo_Persona] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Numero_Persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Centro_Medico] FOREIGN KEY([Numero_Centro_Medico])
REFERENCES [dbo].[Centro_Medico] ([Numero_Centro_Medico])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Centro_Medico]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Doctor] FOREIGN KEY([Numero_Doctor])
REFERENCES [dbo].[Doctor] ([Numero_Doctor])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Doctor]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Persona] FOREIGN KEY([Numero_Persona])
REFERENCES [dbo].[Persona] ([Numero_Persona])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Persona]
GO
ALTER TABLE [dbo].[Credenciales_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Credenciales_Usuario_Persona] FOREIGN KEY([Numero_Persona])
REFERENCES [dbo].[Persona] ([Numero_Persona])
GO
ALTER TABLE [dbo].[Credenciales_Usuario] CHECK CONSTRAINT [FK_Credenciales_Usuario_Persona]
GO
