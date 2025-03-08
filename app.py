from flask import Flask
import os
from flask import send_from_directory

# Create an instance of the Flask class
app = Flask(__name__)

# Define a route for the homepage
@app.route('/')
def home():
    return "Hello, Flask!"

@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'shortcut-icon.png', mimetype='image/webp')

# Start the server
if __name__ == '__main__':
    app.run(debug=True)