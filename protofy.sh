#/bin/bash
cd ../gen-docs/html/
find *.html -type f -exec sed -i 's/struct/message/g;s/Struct/Message/g;s/Class Documentation/Message Documentation/g;s/Public Attributes/Attributes/' {} \;

for name in struct*
do
    newname=message"$(echo "$name" | cut -c7-)"
    mv "$name" "$newname"
done

sed -i.bak -e "82,304d" index.html
