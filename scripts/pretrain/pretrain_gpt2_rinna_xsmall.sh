#!/bin/bash

python train_llava.py \
    --model_name_or_path rinna/japanese-gpt2-xsmall \
    --version plain \
    --freeze_backbone False \
    --tune_mm_mlp_adapter True \
    --vision_tower google/siglip-so400m-patch14-384 \
    --mm_vision_select_layer -2 \
    --mm_projector_type mlp2x_gelu \
    --mm_vision_select_feature patch \
    --data_path ./dataset/llava_pretrain_stair.json \
    --lazy_preprocess False \
    --is_multimodal True \
    --image_folder ./dataset/images \
    --image_aspect_ratio square \
    --optim adamw_torch \
    --model_max_length 1024 \
    --double_quant True \
    --quant_type nf4 \
    --bits 16 \
    --lora_enable False \
    --group_by_modality_length False \
    --fp16 True \
    --bf16 False \
    --output_dir ./output_llava/checkpoints/pretrain-llava-v1.5-japanese-gpt2-xsmall_test \
    --num_train_epochs 1 \
    --per_device_train_batch_size 40 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 1 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 2000 \
    --save_total_limit 1 \
    --learning_rate 1e-3 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --logging_steps 1 \
    --gradient_checkpointing True \
    --dataloader_num_workers 8 \
    --lr_scheduler_type "cosine" \
    --use_wandb \
    --wandb_project llava-jp-test \
    --wandb_name rinna-xsmall
