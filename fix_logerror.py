import sys
import re

with open("thirdparty/TgVoipWebrtcIOS6/src/tgcalls/EncryptedConnection.cpp", "r") as f:
    content = f.read()

new_content = re.sub(r"return LogError\((.*?)\);", r"LogError(\1);\n        return absl::nullopt;", content)

with open("thirdparty/TgVoipWebrtcIOS6/src/tgcalls/EncryptedConnection.cpp", "w") as f:
    f.write(new_content)
