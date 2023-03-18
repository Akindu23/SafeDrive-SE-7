import tensorflow as tf
from keras.models import load_model

def model_converter(model_name, converted_model_name):
    model = load_model(model_name)
    converter = tf.lite.TFLiteConverter.from_keras_model(model)
    tflite_model = converter.convert()
    open(converted_model_name, "wb").write(tflite_model)

if __name__ == "__main__":
    model_converter("model.h5", "model.tflite")
    