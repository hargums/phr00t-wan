FROM runpod/worker-comfyui:latest-base

# === DOWNLOAD MODEL PHR00T NSFW (Mega-v12 paling bagus 2026) ===
RUN wget -q --show-progress -O /workspace/ComfyUI/models/checkpoints/wan2.2-phr00t-nsfw-v12.safetensors \
    "https://huggingface.co/Phr00t/WAN2.2-14B-Rapid-AllInOne/resolve/main/Mega-v12/wan2.2-rapid-mega-aio-nsfw-v12.2.safetensors"

# Optional: tambah custom nodes kalau workflow kamu butuh (contoh)
# RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git /workspace/ComfyUI/custom_nodes/ComfyUI-Manager

# Copy workflow API kamu (nanti kita buat di langkah berikutnya)
COPY workflow_api.json /workspace/

# Jalankan handler default RunPod
CMD ["python", "-u", "/usr/local/bin/runpod_handler.py"]