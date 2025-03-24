CREATE STORAGE VOLUME quickstart_volume
TYPE = S3
LOCATIONS = ("s3://starrocks")
PROPERTIES
(
    "enabled" = "true",
    "aws.s3.region" = "us-east-1",
    "aws.s3.endpoint" = "http://minio.warehouse.svc.cluster.local:9000",
    "aws.s3.access_key" = "starrocks_access_key",
    "aws.s3.secret_key" = "starrocks_secret_key",
    "aws.s3.enable_partitioned_prefix" = "true"
);

SET quickstart_volume AS DEFAULT STORAGE VOLUME;

CREATE DATABASE quickstart_db;

USE quickstart_db;

CREATE TABLE IF NOT EXISTS crashdata (
    CRASH_DATE DATETIME,
    COLLISION_ID INT,
    BOROUGH STRING,
    ZIP_CODE STRING,
    LATITUDE INT,
    LONGITUDE INT,
    LOCATION STRING,
    ON_STREET_NAME STRING,
    CROSS_STREET_NAME STRING,
    OFF_STREET_NAME STRING,
    CONTRIBUTING_FACTOR_VEHICLE_1 STRING,
    CONTRIBUTING_FACTOR_VEHICLE_2 STRING,
    VEHICLE_TYPE_CODE_1 STRING,
    VEHICLE_TYPE_CODE_2 STRING)
DUPLICATE KEY(CRASH_DATE, COLLISION_ID)
DISTRIBUTED BY HASH(CRASH_DATE)
PROPERTIES (
    "storage_volume" = "quickstart_volume",
    "datacache.enable" = "true",
    "datacache.partition_duration" = "1 MONTH"
);

CREATE TABLE IF NOT EXISTS weatherdata (
    DATE DATETIME,
    NAME STRING,
    HourlyDewPointTemperature STRING,
    HourlyDryBulbTemperature STRING,
    HourlyPrecipitation STRING,
    HourlyPresentWeatherType STRING,
    HourlyPressureChange STRING,
    HourlyPressureTendency STRING,
    HourlyRelativeHumidity STRING,
    HourlySkyConditions STRING,
    HourlyVisibility STRING,
    HourlyWetBulbTemperature STRING,
    HourlyWindDirection STRING,
    HourlyWindGustSpeed STRING,
    HourlyWindSpeed STRING)
PROPERTIES (
    "storage_volume" = "quickstart_volume",
    "datacache.enable" = "true",
    "datacache.partition_duration" = "1 MONTH"
);