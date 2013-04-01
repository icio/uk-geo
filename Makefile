.PHONY: all

all: fetch

clean:
	@echo Not source data directory.
	rm -rf data

deps:
	bin/dependencies.sh


# ==========================================
# Fetch

fetch: fetch-cso fetch-nisra fetch-sns fetch-ons


# Fetch: NISRA

fetch-nisra: deps
	bin/fetch-archive http://www.nisra.gov.uk/deprivation/archive/SOA_NI_ESRI.zip nisra/super-output-areas


# Fetch: SNS

fetch-sns: fetch-sns-shapes fetch-sns-stats

fetch-sns-shapes: deps
	bin/fetch-sns-shapes sns/shapes

fetch-sns-stats: deps
	bin/fetch-archive http://www.sns.gov.uk/BulkDownloads/SNS_FullData_CSV_14_3_2013.zip sns/stats


# Fetch: ONS

fetch-ons: fetch-ons-boundaries fetch-ons-oa fetch-ons-lsoa fetch-ons-msoa

fetch-ons-boundaries: deps
	bin/fetch-archive http://data.statistics.gov.uk/ONSGeography/CensusGeography/Boundaries/2011/OA/OA_2011_EW_BFE_shp.zip ons/boundaries

fetch-ons-oa: deps
	bin/fetch-archive http://data.statistics.gov.uk/ONSGeography/CensusGeography/Lookups/2011/OA/OA01_OA11_LAD11_EW_LU_csv.zip ons/oa

fetch-ons-lsoa: deps
	bin/fetch-archive http://data.statistics.gov.uk/ONSGeography/CensusGeography/Lookups/2011/Other/LSOA01_LSOA11_LAD11_EW_LU_csv.zip ons/lsoa

fetch-ons-msoa: deps
	bin/fetch-archive http://data.statistics.gov.uk/ONSGeography/CensusGeography/Lookups/2011/Other/MSOA01_MSOA11_LAD11_EW_LU_csv.zip ons/msoa


# Fetch: CSO

fetch-cso: fetch-cso-provinces fetch-cso-nuts-2 fetch-cso-nuts-3 fetch-cso-administrative-counties fetch-cso-electoral-divisions fetch-cso-small-areas fetch-cso-constituency-boundaries-2007 fetch-cso-gaeltacht-areas fetch-cso-electoral-areas-2008 fetch-cso-legal-towns-cities fetch-cso-settlements

fetch-cso-provinces: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Province_generalised20m.zip cso/provinces

fetch-cso-nuts-2: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_NUTS2_generalised20m.zip cso/nuts-2

fetch-cso-nuts-3: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_NUTS3_generalised20m.zip cso/nuts-3

fetch-cso-administrative-counties: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Admin_Counties_generalised20m.zip cso/administrative-counties
	bin/fetch-file http://census.cso.ie/censusasp/saps/boundaries/COP2011_counties_website.csv cso/administrative-counties

fetch-cso-electoral-divisions: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Electoral_Divisions_generalised20m.zip cso/electoral-divisions
	bin/fetch-file http://census.cso.ie/censusasp/saps/boundaries/COP2011_ED_website.csv cso/electoral-divisions

fetch-cso-small-areas: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Small_Areas_generalised20m.zip cso/small-areas
	bin/fetch-file http://census.cso.ie/censusasp/saps/boundaries/COP2011_SA_data_website.csv cso/small-areas

fetch-cso-constituency-boundaries-2007: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Constituencies_2007.zip cso/constituency-boundaries-2007

fetch-cso-gaeltacht-areas: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Gaeltacht.zip cso/gaeltacht-areas

fetch-cso-electoral-areas-2008: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Local_Electoral_Areas_2008.zip cso/electoral-areas-2008

fetch-cso-legal-towns-cities: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Cities_Legal_Towns.zip cso/legal-towns-cities

fetch-cso-settlements: deps
	bin/fetch-archive http://census.cso.ie/censusasp/saps/boundaries/Census2011_Settlements.zip cso/settlements
