#_*_encoding:utf-8_*_
from csvHandle import CSV
from ipaddress import IPHandle

def matchandpick(list, input_IP, input_Netmask):
    pick = {}
    for i in list:
        if IPHandle(input_IP, input_Netmask, i['ip']).compareSubnet() == True :
            if pick.has_key(i['service']) == True:
                pick[i['service']] = pick[i['service']] + 1
            else:
                pick[i['service']] = 1

    return pick



if __name__ == '__main__':

    reading_file = 'data.csv'
    csvH = CSV(reading_file)
    list = csvH.csvHandle()
    input_IP = raw_input('请输入ip地址:')
    input_Netmask = raw_input('请输入子网掩码:')
    pick = matchandpick(list, input_IP, input_Netmask)
    print pick
