#_*_encoding:utf-8_*_
from IPy import IP


class IPHandle():

    def __init__(self, input_IP, input_Netmask, specific_IP):
        self.input_IP = input_IP
        self.input_Netmask = input_Netmask
        self.specific_IP = specific_IP


    def compareSubnet(self):

        list1 = self.input_IP.split('.')
        if len(list1) != 4:
          print "您输入的ip地址不合法，请重新输入！"
          exit()
        for i in list1:
          if i.isdigit() == True and int(i) >=0 and int(i) <= 255:
            pass
          else:
            print "您输入的ip地址不合法，请重新输入！"
            exit()

        list2 = self.input_Netmask.split('.')
        if len(list2) != 4:
          print "您输入的子网掩码不合法，请重新输入!"
          exit()
        for i in list2:
          if i.isdigit() == True and int(i) >=0 and int(i) <= 255:
            pass
          else:
            print "您输入的子网掩码不合法，请重新输入!"
            exit()
        #print "您所在的网段为:%s" % (IP(self.input_IP).make_net(self.input_Netmask))

        ip_Subnet = IP(self.input_IP).make_net(self.input_Netmask)


        if self.specific_IP in ip_Subnet:
            return True
            print "在网段内"
        else:
            return False
            print "不在网段内"



if __name__ == '__main__':

    input_IP = raw_input('请输入ip地址:')
    input_Netmask = raw_input('请输入子网掩码:')
    specific_IP = raw_input('请输入任意ip地址:')
    iphandle = IPHandle(input_IP, input_Netmask, specific_IP)
    result = iphandle.compareSubnet()
    print result