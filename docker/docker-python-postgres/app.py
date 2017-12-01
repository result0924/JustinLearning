# coding:utf-8

from flask import Flask
from flasksql import db
from flasksql import User

app = Flask(__name__)

@app.route("/")
def hello():
    admin = User.query.filter_by(username='admin').first().email
    guest = User.query.filter_by(username='guest').first().username
    haha = 'haha'
    html = "<b>Admin:</b>{admin}<br/>" \
           "<b>guest:</b>{guest}<br/>" \
           "<b>haha:</b>{haha}"
    return html.format(admin = admin, guest = guest, haha=haha)

if __name__ == "__main__":
    db.create_all()

    if User.query.filter_by(username='admin').first() is None:     
        admin = User(username='admin', email='admin@example.com')
        guest = User(username='guest', email='guest@example.com')
        db.session.add(admin)
        db.session.add(guest)
        db.session.commit()

    app.run(host='0.0.0.0', port=80)