#https://stackoverflow.com/questions/27893804/udp-client-server-socket-in-python

import socket
print ("initialising...")
server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server_socket.bind(('', 55555))

print ("listening on 55555...")

while True:
    message, address = server_socket.recvfrom(1024)
    message = message.upper()
    print (message)