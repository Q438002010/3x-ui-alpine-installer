#!/bin/bash

# ����Ƿ��� Alpine Linux
if ! grep -q "Alpine" /etc/os-release; then
  echo "�˽ű���֧�� Alpine Linux��"
  exit 1
fi

# ���°��б�
echo "����ϵͳ���б�..."
apk update

# ��װ��Ҫ������
echo "��װ��Ҫ������..."
apk add --no-cache bash curl wget

# ���尲װ·��
INSTALL_PATH="/usr/local/3x-ui"

# ������װĿ¼
echo "������װĿ¼..."
mkdir -p "$INSTALL_PATH"

# �����������ļ�
echo "�����������ļ�..."
curl -Ls https://raw.githubusercontent.com/xeefei/3x-ui/master/install.sh -o "$INSTALL_PATH/install.sh"

# ���ű�ִ��Ȩ��
chmod +x "$INSTALL_PATH/install.sh"

# ִ�а�װ�ű�
echo "ִ�а�װ�ű�..."
bash "$INSTALL_PATH/install.sh"

# ����װ�����е���ʱ�ļ�
echo "����װ����..."
rm -rf "$INSTALL_PATH/install.sh"

echo "��װ��ɣ�"
