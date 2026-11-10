import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mytask/config/app_config.dart';
import 'package:mytask/core/components/button/primary_button.dart';
import 'package:mytask/core/components/feedback/app_snackbar.dart';
import 'package:mytask/core/components/textfield/primary_textfield.dart';
import 'package:mytask/core/design_system/app_colors.dart';
import 'package:mytask/core/design_system/app_typography.dart';
import 'package:mytask/core/utils/date_formatter.dart';
import 'package:mytask/features/task/domain/entities/task_entity.dart';
import 'package:mytask/features/task/domain/entities/task_filter.dart';
import 'package:mytask/features/task/presentation/bloc/task_form_cubit.dart';
import 'package:mytask/features/task/presentation/bloc/task_form_state.dart';
import 'package:mytask/features/task/presentation/widgets/task_priority_selector.dart';
import 'package:mytask/injection/injector.dart';

class AddTaskScreen extends StatefulWidget {
  final TaskEntity? taskToEdit;

  const AddTaskScreen({super.key, this.taskToEdit});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _courseController;
  late final TextEditingController _descriptionController;
  final TextEditingController _subtaskInputController = TextEditingController();

  DateTime _selectedDeadline = DateTime.now().add(const Duration(days: 1, hours: 2));
  TaskPriority _selectedPriority = TaskPriority.medium;
  final List<SubTaskEntity> _subtasks = [];

  static const List<String> _courseOptions = [
    'Mobile Development',
    'Data Structures',
    'Database Systems',
    'UI/UX Design',
    'Kecerdasan Buatan',
    'Jaringan Komputer',
    'Rekayasa Perangkat Lunak',
    'Algoritma Pemrograman',
  ];

  @override
  void initState() {
    super.initState();
    final edit = widget.taskToEdit;
    _titleController = TextEditingController(text: edit?.title ?? '');
    _courseController = TextEditingController(text: edit?.course ?? '');
    _descriptionController = TextEditingController(text: edit?.description ?? '');

    if (edit != null) {
      _selectedDeadline = edit.deadline;
      _selectedPriority = edit.priority;
      _subtasks.addAll(edit.subtasks);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _courseController.dispose();
    _descriptionController.dispose();
    _subtaskInputController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDeadline,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: AppColors.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && mounted) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDeadline),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(primary: AppColors.primary),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null && mounted) {
        setState(() {
          _selectedDeadline = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _addSubtask() {
    final text = _subtaskInputController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _subtasks.add(
        SubTaskEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: text,
          isDone: false,
        ),
      );
      _subtaskInputController.clear();
    });
  }

  void _removeSubtask(int index) {
    setState(() {
      _subtasks.removeAt(index);
    });
  }

  void _submitForm(BuildContext context) {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      AppSnackBar.showError(
        context,
        'Mohon lengkapi semua data wajib yang ditandai bintang (*)',
      );
      return;
    }

    context.read<TaskFormCubit>().saveTask(
          id: widget.taskToEdit?.id,
          title: _titleController.text,
          course: _courseController.text,
          deadline: _selectedDeadline,
          priority: _selectedPriority,
          description: _descriptionController.text,
          subtasks: _subtasks,
          isCompleted: widget.taskToEdit?.isCompleted ?? false,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.taskToEdit != null;

    return BlocProvider(
      create: (context) => sl<TaskFormCubit>(),
      child: BlocConsumer<TaskFormCubit, TaskFormState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (message, _) {
              AppSnackBar.showSuccess(context, message);
              Navigator.of(context).pop(true);
            },
            error: (message) {
              AppSnackBar.showError(context, message);
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            submitting: () => true,
            orElse: () => false,
          );

          return Scaffold(
            backgroundColor: AppColors.bgPrimary,
            appBar: AppBar(
              title: Text(
                isEditing ? 'Edit Task' : 'Add Task',
                style: AppTypography.heading3,
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    // Task Title Field
                    PrimaryTextField(
                      controller: _titleController,
                      label: 'Task Title',
                      hint: 'Enter task title',
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Judul tugas tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    Space.h(16),

                    // Course / Category Field
                    PrimaryTextField(
                      controller: _courseController,
                      label: 'Course / Category',
                      hint: 'Select course or category',
                      isRequired: true,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nama mata kuliah tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    Space.h(8),

                    // Quick Course Chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: _courseOptions.map((course) {
                          final isSelected = _courseController.text.trim().toLowerCase() == course.toLowerCase();
                          return Padding(
                            padding: EdgeInsets.only(right: 6.w),
                            child: ActionChip(
                              label: Text(
                                course,
                                style: AppTypography.caption.copyWith(
                                  color: isSelected ? AppColors.textInverse : AppColors.textSecondary,
                                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                ),
                              ),
                              backgroundColor: isSelected ? AppColors.primary : AppColors.surfaceCard,
                              side: BorderSide(
                                color: isSelected ? AppColors.primary : AppColors.borderSubtle,
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
                              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                              onPressed: () {
                                setState(() {
                                  _courseController.text = course;
                                });
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Space.h(16),

                    // Deadline Picker Trigger Field (Solid Calendar Icon)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Deadline',
                              style: AppTypography.titleMedium.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            Space.w(4),
                            Text(
                              '*',
                              style: AppTypography.titleMedium.copyWith(
                                color: AppColors.danger,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Space.h(8),
                        InkWell(
                          onTap: _pickDateTime,
                          borderRadius: BorderRadius.circular(12.r),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceInput,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: AppColors.borderInput),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_rounded,
                                  size: 20.w,
                                  color: AppColors.primary,
                                ),
                                Space.w(12),
                                Expanded(
                                  child: Text(
                                    DateFormatter.formatDeadline(_selectedDeadline),
                                    style: AppTypography.bodyLarge,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 20.w,
                                  color: AppColors.textTertiary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Space.h(16),

                    // Priority Selector (Low, Medium, High)
                    TaskPrioritySelector(
                      selectedPriority: _selectedPriority,
                      onPriorityChanged: (priority) {
                        setState(() => _selectedPriority = priority);
                      },
                    ),
                    Space.h(16),

                    // Notes / Description
                    PrimaryTextField(
                      controller: _descriptionController,
                      label: 'Notes',
                      hint: 'Add notes or description (optional)',
                      maxLines: 4,
                      maxLength: 500,
                      keyboardType: TextInputType.multiline,
                    ),
                    Space.h(16),

                    // Subtasks / Checklist builder
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Subtasks (Optional)', style: AppTypography.titleMedium),
                        Text('${_subtasks.length} items', style: AppTypography.caption),
                      ],
                    ),
                    Space.h(8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _subtaskInputController,
                            style: AppTypography.bodyMedium,
                            decoration: InputDecoration(
                              hintText: 'Tambah subtugas (misal: Bab 1)',
                              hintStyle: AppTypography.caption,
                              contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                              filled: true,
                              fillColor: AppColors.surfaceInput,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(color: AppColors.borderInput),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(color: AppColors.borderInput),
                              ),
                            ),
                            onSubmitted: (_) => _addSubtask(),
                          ),
                        ),
                        Space.w(8),
                        IconButton(
                          onPressed: _addSubtask,
                          icon: const Icon(Icons.add_circle_rounded, color: AppColors.primary),
                          iconSize: 32.w,
                        ),
                      ],
                    ),

                    if (_subtasks.isNotEmpty) ...[
                      Space.h(8),
                      ..._subtasks.asMap().entries.map((entry) {
                        final index = entry.key;
                        final subtask = entry.value;
                        return Container(
                          margin: EdgeInsets.only(bottom: 6.h),
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceCard,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.check_circle_rounded, size: 18.w, color: AppColors.textTertiary),
                              Space.w(8),
                              Expanded(
                                child: Text(subtask.title, style: AppTypography.bodySmall),
                              ),
                              IconButton(
                                icon: Icon(Icons.close_rounded, size: 16.w, color: AppColors.danger),
                                onPressed: () => _removeSubtask(index),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],

                    Space.h(28),

                    // Action Button: Save Task
                    PrimaryButton(
                      text: isEditing ? 'Update Task' : 'Save Task',
                      leadingIcon: Icons.save_rounded,
                      isLoading: isLoading,
                      onPressed: () => _submitForm(context),
                    ),
                    Space.h(24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
