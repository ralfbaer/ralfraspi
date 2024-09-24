import influxdb_client
from influxdb_client.client.write_api import SYNCHRONOUS

json_body = [
        {
            "measurement": "cpu_load_short",
            "tags": {
                "host": "server01",
                "region": "us-west"
            },
            "time": "2009-11-10T23:00:00Z",
            "fields": {
                "value": 0.64
            }
        }
    ]


def WriteToDB(AL):
                InfluxBucketName=App_Config.get("config.InfluxDB_BUCKET")
                InfluxOrganisationName=App_Config.get("config.InfluxDB_ORG")
                InfluxURL=App_Config.get("config.InfluxDB_URL")
                InfluxToken=App_Config.get("config.InfluxDB_APIKey")

                App_Config.log.debug("\t\t\t open InfluxDB URL" + InfluxURL)

                InfluxDB_client = influxdb_client.InfluxDBClient(url=InfluxURL, token=InfluxToken, org=InfluxOrganisationName)
                InfluxDB_write_api = InfluxDB_client.write_api(write_options=SYNCHRONOUS)
                App_Config.log.info("\t\t\t write to InfluxDB 1: {}".format(InfluxBucketName))
                InfluxDB_write_api.write(bucket=InfluxBucketName , record=AL.requests)
                App_Config.log.info("\t\t\t write to InfluxDB 2: {}".format(InfluxBucketName))
                InfluxDB_write_api.write(bucket=InfluxBucketName , record=AL.TotalRequests)
