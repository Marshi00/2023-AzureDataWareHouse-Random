IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'syworkspace01gen2filesys_syworkspace01gen2account_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [syworkspace01gen2filesys_syworkspace01gen2account_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://syworkspace01gen2filesys@syworkspace01gen2account.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.staging_accidents (
	[ID] nvarchar(4000),
	[Severity] nvarchar(4000),
	[Start_Time] nvarchar(4000),
	[End_Time] nvarchar(4000),
	[Start_Lat] nvarchar(4000),
	[Start_Lng] nvarchar(4000),
	[End_Lat] nvarchar(4000),
	[End_Lng] nvarchar(4000),
	[Distance(mi)] nvarchar(4000),
	[Description] nvarchar(4000),
	[Number] nvarchar(4000),
	[Street] nvarchar(4000),
	[Side] nvarchar(4000),
	[City] nvarchar(4000),
	[County] nvarchar(4000),
	[State] nvarchar(4000),
	[Zipcode] nvarchar(4000),
	[Country] nvarchar(4000),
	[Timezone] nvarchar(4000),
	[Airport_Code] nvarchar(4000),
	[Weather_Timestamp] nvarchar(4000),
	[Temperature(F)] nvarchar(4000),
	[Wind_Chill(F)] nvarchar(4000),
	[Humidity(%)] nvarchar(4000),
	[Pressure(in)] nvarchar(4000),
	[Visibility(mi)] nvarchar(4000),
	[Wind_Direction] nvarchar(4000),
	[Wind_Speed(mph)] nvarchar(4000),
	[Precipitation(in)] nvarchar(4000),
	[Weather_Condition] nvarchar(4000),
	[Amenity] nvarchar(4000),
	[Bump] nvarchar(4000),
	[Crossing] nvarchar(4000),
	[Give_Way] nvarchar(4000),
	[Junction] nvarchar(4000),
	[No_Exit] nvarchar(4000),
	[Railway] nvarchar(4000),
	[Roundabout] nvarchar(4000),
	[Station] nvarchar(4000),
	[Stop] nvarchar(4000),
	[Traffic_Calming] nvarchar(4000),
	[Traffic_Signal] nvarchar(4000),
	[Turning_Loop] nvarchar(4000),
	[Sunrise_Sunset] nvarchar(4000),
	[Civil_Twilight] nvarchar(4000),
	[Nautical_Twilight] nvarchar(4000),
	[Astronomical_Twilight] nvarchar(4000)
	)
	WITH (
	LOCATION = 'US_Accidents_Dec21_updated.csv',
	DATA_SOURCE = [syworkspace01gen2filesys_syworkspace01gen2account_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT COUNT (*) FROM dbo.staging_accidents
GO