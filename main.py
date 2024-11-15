# Import necessary libraries
from fastapi import FastAPI
from pydantic import BaseModel
import pickle
import numpy as np
import uvicorn

# Load the ML model
with open("model.pkl", "rb") as f:
    model = pickle.load(f)

# Define the input data schema
class HardnessInput(BaseModel):
    initial_hardness: float
    tempering_time: float
    tempering_temperature: float
    C: float
    Mn: float
    P: float
    S: float
    Si: float
    Ni: float
    Cr: float
    Mo: float
    V: float
    Al: float
    Cu: float

# Initialize FastAPI
app = FastAPI()

@app.post("/predict")
async def predict(input_data: HardnessInput):
    # Prepare input data for the model
    features = np.array([[1,4,input_data.initial_hardness, input_data.tempering_time, input_data.tempering_temperature,
                          input_data.C, input_data.Mn, input_data.P, input_data.S, input_data.Si, input_data.Ni,
                          input_data.Cr, input_data.Mo, input_data.V, input_data.Al, input_data.Cu]])
    # Make prediction
    prediction = model.predict(features)
    return {"final_hardness": prediction[0][0]}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
