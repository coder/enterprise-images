# VNC in Coder

A [sample image](https://github.com/cdr/enterprise-images/tree/main/images/vnc) for Coder that uses [noVNC](https://github.com/novnc/noVNC) as the client and [TigerVNC](https://tigervnc.org) as the server.

## To connect

- Option 1 (Web): Create a dev URL on port `6081` and navigate to it
- Option 2 (SSH Tunneling): Use SSH tunneling to expose the VNC server to your local machine. You will need the [coder-cli](https://github.com/cdr/coder-cli), and a VNC client installed on your local machine.

    ```sh
    coder config-ssh
    ssh -L 5990:localhost:localhost:5990 coder.[env-name]
    # Connect VNC client to localhost:5990
    ```
