CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'time_series_daily') THEN
        DROP TABLE IF EXISTS public.time_series_daily;
    END IF;
END $$;

DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'tickers') THEN
        DROP TABLE IF EXISTS public.tickers;
    END IF;
END $$;

CREATE TABLE public.tickers
(
    ID UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
    Ticker VARCHAR(50) NOT NULL,
	IsInPortfolio BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE time_series_daily (
	ID UUID PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
	Date DATE NOT NULL,
	Close VARCHAR(250) NOT NULL,
	High VARCHAR(250) NOT NULL,
	Low VARCHAR(250) NOT NULL,
	Opens VARCHAR(250) NOT NULL,
	Volumne VARCHAR(1000) NOT NULL,
	Ticker UUID NOT NULL REFERENCES tickers(ID)
);