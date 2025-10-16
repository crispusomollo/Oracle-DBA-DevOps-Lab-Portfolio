import os
import subprocess

def check_env_vars():
    print("[*] Checking environment variables...")
    required = ["ORACLE_HOME", "ORACLE_SID"]
    for var in required:
        val = os.environ.get(var)
        if val:
            print(f"[✓] {var} = {val}")
        else:
            print(f"[✗] {var} not set")

#def check_listener():
 #   print("[*] Checking listener...")
  #  try:
   #     result = subprocess.run(["lsnrctl", "status"], capture_output=True, text=True)
    #    if "STATUS of the LISTENER" in result.stdout:
     #       print("[✓] Listener is running.")
      #  else:
       #     print("[✗] Listener not detected.")
    #except FileNotFoundError:
     #   print("[✗] lsnrctl not found in PATH")

def check_listener():
    print("[*] Checking listener (client-side)...")
    try:
        result = subprocess.run(["lsnrctl", "status"], capture_output=True, text=True)
        if "STATUS of the LISTENER" in result.stdout:
            print("[✓] Listener is running.")
        else:
            print("[✗] Listener not detected.")
    except FileNotFoundError:
        print("[i] lsnrctl not installed (expected on client)")

def check_sqlplus():
    print("[*] Checking SQL*Plus...")
    try:
        result = subprocess.run(["sqlplus", "-v"], capture_output=True, text=True)
        if "SQL*Plus" in result.stdout:
            print(f"[✓] {result.stdout.strip()}")
        else:
            print("[✗] SQL*Plus check failed.")
    except FileNotFoundError:
        print("[✗] sqlplus not found in PATH")

if __name__ == "__main__":
    check_env_vars()
    check_listener()
    check_sqlplus()

