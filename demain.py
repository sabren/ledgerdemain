# dis is de main app.
import platonic


def wsgi(env, start):
    start('200 OK', [('Content-type','text/plain')])
    yield "hello world"
    

def app_factory(*args):
    return wsgi
