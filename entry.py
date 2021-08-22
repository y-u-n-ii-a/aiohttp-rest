from aiohttp import web

from api.app import create_app


if __name__ == '__main__':
    app = create_app(config={})
    web.run_app(app=app)
