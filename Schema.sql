CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

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