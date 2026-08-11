import os

with open('theos/Twelvium/Sources.mk', 'r') as f:
    content = f.read()

# Replace $$ with \$$
content = content.replace('$$', r'\$$')

with open('theos/Twelvium/Sources.mk', 'w') as f:
    f.write(content)
