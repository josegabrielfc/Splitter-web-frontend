import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/providers/question_provider.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';
import '../../../config/environment/environment.dart';
import '../../../widgets/widgets_general.dart';

class WorkflowPage extends StatefulWidget {
  const WorkflowPage({super.key});

  @override
  _WorkflowPageState createState() => _WorkflowPageState();
}

class _WorkflowPageState extends State<WorkflowPage> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _answerControllers =
      List.generate(4, (index) => TextEditingController());
  String? _selectedCategory;

  final List<String> _categories = [
    'Concepto de fracción',
    'Simplificar fracciones',
    'Fracciones equivalentes',
    'Sumar y restar fracciones',
    'Multiplicar y dividir fracciones',
  ];

  @override
  void dispose() {
    _questionController.dispose();
    for (var controller in _answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _saveQuestion() {
    if (_formKey.currentState!.validate()) {
      final question = _questionController.text;
      final answers =
          _answerControllers.map((controller) => controller.text).toList();

      final newQuestion = {
        'category': _selectedCategory,
        'question': question,
        'answers': answers,
      };

      Provider.of<QuestionProvider>(context, listen: false)
          .addQuestion(newQuestion);

      // Clear the form
      _questionController.clear();
      for (var controller in _answerControllers) {
        controller.clear();
      }
      setState(() {
        _selectedCategory = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pregunta guardada')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Crear Pregunta'),
        centerTitle: true,
        backgroundColor: rojoColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                hint: const Text('Seleccione una categoría'),
                decoration: InputDecoration(
                  labelText: 'Categoría',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                items: _categories
                    .map((category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Por favor seleccione una categoría';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _questionController,
                decoration: InputDecoration(
                  labelText: 'Pregunta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una pregunta';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ..._answerControllers.asMap().entries.map((entry) {
                final index = entry.key;
                final controller = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Respuesta ${index + 1}',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una respuesta';
                      }
                      return null;
                    },
                  ),
                );
              }).toList(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveQuestion,
                child: const Text('Guardar Pregunta'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: const TextStyle(fontSize: 18.0),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Preguntas Guardadas',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Consumer<QuestionProvider>(
                builder: (context, questionProvider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questionProvider.questions.length,
                    itemBuilder: (context, index) {
                      final questionData = questionProvider.questions[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          title: Text(questionData['question']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Categoría: ${questionData['category']}'),
                              Text(
                                  'Respuestas: ${questionData['answers'].join(', ')}'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
