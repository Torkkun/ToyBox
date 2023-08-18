sudo ip netns add ns1
sudo ip netns add ns2

sudo ip link add name br0 type bridge
sudo ip a add 172.16.0.1/12 dev br0
sudo ip link set dev br0 up

sudo ip link add dev veth0 type veth peer name veth1
sudo ip link add dev veth2 type veth peer name veth3

sudo ip link set dev veth0 netns ns1
sudo ip link set dev veth2 netns ns2

sudo ip link set veth1 master br0
sudo ip link set veth3 master br0

sudo ip netns exec ns1 ip link set dev veth0 name eth0 address 02:42:c0:a8:00:02
sudo ip netns exec ns1 ip addr add dev eth0 172.16.0.2/12
sudo ip netns exec ns2 ip link set dev veth2 name eth0 address 02:42:c0:a8:00:03
sudo ip netns exec ns2 ip addr add dev eth0 172.16.0.3/12
sudo ip netns exec ns1 ip link set dev eth0 up
sudo ip netns exec ns2 ip link set dev eth0 up

sudo ip link set dev veth1 up
sudo ip link set dev veth3 up

sudo ip netns exec ns1 ip link add dev vxlan0 type vxlan id 42 group 239.1.1.1 dev eth0 dstport 4789
sudo ip netns exec ns2 ip link add dev vxlan0 type vxlan id 42 group 239.1.1.1 dev eth0 dstport 4789

sudo ip netns exec ns1 ip addr add dev vxlan0 192.168.0.1/24
sudo ip netns exec ns2 ip addr add dev vxlan0 192.168.0.2/24

sudo ip netns exec ns1 ip link set dev vxlan0 up
sudo ip netns exec ns2 ip link set dev vxlan0 up