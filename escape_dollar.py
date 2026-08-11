import os

with open('theos/Twelvium/Sources.mk', 'r') as f:
    content = f.read()

content = content.replace('$', '$$')

with open('theos/Twelvium/Sources.mk', 'w') as f:
    f.write(content)
