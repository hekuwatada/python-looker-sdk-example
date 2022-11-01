"""
Outputs list of all dashboards in Looker

Usage:
    python <this file>
"""
import looker_sdk
from looker_sdk import models40

# configure the SDK with Looker credentials
# NOTE: run `make setup` to create `looker.ini` file
sdk = looker_sdk.init40("./looker.ini")


def format_dashboard(dashboard: models40.DashboardBase) -> str:
    return f"{dashboard.id},{dashboard.title}"


def print_dashboard_info_for_all_dashboards() -> None:
    # call Looker SDK to get all dashboards
    # https://developers.looker.com/api/explorer/4.0/methods/Dashboard/all_dashboards?sdk=py
    dashboards: Sequence[models40.DashboardBase] = sdk.all_dashboards()

    # format each dashboard object as string
    dashboards_string = list(map(format_dashboard, dashboards))

    # print the dashboards
    print("\n".join(dashboards_string))


if __name__ == "__main__":
    print_dashboard_info_for_all_dashboards()
