FROM public.ecr.aws/sam/build-python3.9:latest-arm64

RUN cd && \
    python3.9 -m venv env && \
    source env/bin/activate && \
    pip install --upgrade pip && \
    pip install opencv-contrib-python-headless && \
    pip freeze > requirements.txt && \
    deactivate

RUN cd && mkdir python && \
    cp -pa env/lib/python3.9/site-packages/* python/ && \
    zip -ry opencv_layer.zip python