pipenv run ansible-playbook playbooks/main.yml
robot --consolecolors on \
    -r none \
    --log ./live/robot/lab-log \
    --output ./live/robot/lab-out \
    --xunit ./live/robot/lab-xunit \
    ../robot/client1.robot
if [ "$?" -eq "0" ]
then
  echo "POST succeeded"
else
  echo "POST failed, rolling back"
  pipenv run ansible-playbook playbooks/rollback.yml
fi
robot --consolecolors on \
    -r none \
    --log ./live/robot-rollback/lab-log \
    --output ./live/robot-rollback/lab-out \
    --xunit ./live/robot-rollback/lab-xunit \
    ../robot/client1.robot
