#!/usr/bin/env python3

from sense_energy import Senseable
import os
from flask import Flask

app = Flask(__name__)

def get_metrics(username, password):

    sense = Senseable()
    sense.authenticate(username, password)
    sense.update_realtime()
    sense.update_trend_data()

    metrics = []

    metrics.append("HELP sense_active_power Active power (Watts).")
    metrics.append("TYPE sense_active_power gauge")
    metrics.append("sense_active_power {}".format(sense.active_power))

    metrics.append("HELP sense_active_voltage_leg1 Active voltage leg1 (Volts).")
    metrics.append("TYPE sense_active_voltage_leg1 gauge")
    metrics.append("sense_active_voltage_leg1 {}".format(sense.active_voltage[0]))

    metrics.append("HELP sense_active_voltage_leg2 Active voltage leg2 (Volts).")
    metrics.append("TYPE sense_active_voltage_leg2 gauge")
    metrics.append("sense_active_voltage_leg2 {}".format(sense.active_voltage[1]))

    metrics.append("HELP sense_daily_usage Daily usage (Kilowatts).")
    metrics.append("TYPE sense_daily_usage gauge")
    metrics.append("sense_daily_usage {}".format(sense.daily_usage))

    metrics.append("HELP sense_weekly_usage Daily usage (Kilowatts).")
    metrics.append("TYPE sense_weekly_usage gauge")
    metrics.append("sense_weekly_usage {}".format(sense.weekly_usage))

    metrics.append("HELP sense_monthly_usage Daily usage (Kilowatts).")
    metrics.append("TYPE sense_monthly_usage gauge")
    metrics.append("sense_monthly_usage {}".format(sense.monthly_usage))

    metrics.append("HELP sense_yearly_usage Daily usage (Kilowatts).")
    metrics.append("TYPE sense_yearly_usage gauge")
    metrics.append("sense_yearly_usage {}".format(sense.yearly_usage))

    return '\n'.join(metrics)

@app.route("/")
def root():
    return """<html>
              <head><title>Sense Exporter</title></head>
              <body>
              <h1>Sense Exporter</h1>
              <p><a href="/metrics">Metrics</a></p>
              </body>
              </html>"""

@app.route("/metrics/")
def metrics():
    return get_metrics(username=os.getenv("SENSE_USERNAME"), password=os.getenv("SENSE_PASSWORD"))

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port="10000"))
