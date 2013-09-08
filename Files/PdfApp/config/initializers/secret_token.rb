# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
PdfApp::Application.config.secret_key_base = '255c2ee16443b91bcc07d39627a60e810fadd793c6c1e5bc556035763372ae87803a674d902751a37f84259e7b63b6f538d18cf79cb50e1f729de9f1d8129212'
