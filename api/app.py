from typing import Any

from aiohttp import web
from aiohttp.web_app import Application

from api.middlwares import get_middlewares
from api.routes import setup_routes


async def create_app(config: dict[str, Any]) -> Application:
    app = web.Application(middlewares=get_middlewares())

    app["config"] = config

    setup_routes(app=app)

    return app
