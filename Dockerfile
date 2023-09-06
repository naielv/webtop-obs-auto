FROM kasmweb/core-ubuntu-focal:1.14.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########



RUN sudo add-apt-repository -y ppa:obsproject/obs-studio
RUN sudo apt update
RUN sudo apt-get install obs-studio speech-dispatcher python3-pip -y
RUN sudo -H pip3 install requests

COPY ./obs.json $HOME/Desktop/OBSScenes.json
COPY ./c.py $HOME/Desktop/c.py


######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
