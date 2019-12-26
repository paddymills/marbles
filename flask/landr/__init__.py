import os

from flask import Flask, render_template


def create_app():
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='development',
        DATABASE=os.path.join(app.instance_path, 'landr.sqlite')
    )

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route('/')
    def main():
        return render_template('particles.html')

    return app
